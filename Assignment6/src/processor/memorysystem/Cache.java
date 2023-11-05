package processor.memorysystem;

import java.util.Vector;

import configuration.Configuration;
import generic.Element;
import generic.Event;
import generic.MemoryReadEvent;
import generic.MemoryResponseEvent;
import generic.MemoryWriteEvent;
import generic.Simulator;
import generic.Event.EventType;
import processor.Processor;
import processor.Clock;

public class Cache implements Element {

    CacheLine cache[][];

    int number_of_sets, number_of_ways, address;
    Element requestingElement;
    Processor containingProcessor;
    Vector<Vector<Integer>> Counter;

    public Cache(Processor containingProcessor, int number_of_sets, int number_of_ways) {

        this.number_of_sets = number_of_sets;
        this.number_of_ways = number_of_ways;
        this.containingProcessor = containingProcessor;

        cache = new CacheLine[number_of_sets][number_of_ways];
        Counter = new Vector<>();
        for (int i = 0; i < number_of_sets; i++) {
            Vector<Integer> tempCounter = new Vector<>();
            for (int j = 0; j < number_of_ways; j++) {
                cache[i][j] = new CacheLine();
                tempCounter.add(j);
            }
            Counter.add(tempCounter);
        }

    }

    public int getIndex(int address) {
        return address % number_of_sets;
    }

    public int getTag(int address) {
        return address / number_of_sets;
    }

    public boolean lookup(int address) {
        int tag = getTag(address);
        int index = getIndex(address);

        int i = 0;
        while (i < cache[index].length) {
            CacheLine c = cache[index][i];
            if (c.isEmpty() == 0) {
                if (c.getTag() == tag) {
                    return true;
                }
            }
            i++;
        }

        return false;
    }

    public int cacheRead(int address) {
        int tag = getTag(address);
        int index = getIndex(address);

        int i = 0;
        while (i < cache[index].length) {
            CacheLine c = cache[index][i];
            if (c.isEmpty() == 0) {
                if (c.getTag() == tag) {
                    return c.getData();
                }
            }
            i++;
        }

        return -1;
    }

    public void handleCacheMiss(int address) {

        Simulator.getEventQueue().addEvent(
                new MemoryReadEvent(
                        Configuration.mainMemoryLatency + Clock.getCurrentTime(),
                        this,
                        containingProcessor.getMainMemory(),
                        address));
    }

    public int findIndexInCache(int tag, int ind) {

        int i = 0;
        while (i < number_of_ways) {
            if (cache[ind][i].isEmpty() == 0) {
                if (cache[ind][i].getTag() == tag) {
                    return i;
                }
            }
            i++;
        }
        return -1;
    }

    public int findassociativityIndex(int index, int tagCounter) {

        int i = 0;
        while (i < number_of_ways) {
            if (Counter.elementAt(index).elementAt(i) == tagCounter) {
                return i;
            }
            i++;
        }
        return -1;

    }

    private void implementLRU(int value) {
        int tag = getTag(address);
        int index = getIndex(address);
        int associativityIndex = findIndexInCache(tag, index);

        if (associativityIndex != -1) {
            updateExistingCacheLine(index, associativityIndex, value);
        } else {
            replaceLeastRecentlyUsedCacheLine(index, tag, value);
        }
    }

    private void updateExistingCacheLine(int index, int associativityIndex, int value) {
        int tagCounter = findassociativityIndex(index, associativityIndex);
        Counter.elementAt(index).remove(tagCounter);
        Counter.elementAt(index).add(0, associativityIndex);
        cache[index][associativityIndex].setData(value);
    }

    private void replaceLeastRecentlyUsedCacheLine(int index, int tag, int value) {
        int newAssociativityIndex = Counter.elementAt(index).elementAt(number_of_ways - 1);
        cache[index][newAssociativityIndex].setTag(tag);
        cache[index][newAssociativityIndex].setData(value);
        Counter.elementAt(index).remove(number_of_ways - 1);
        Counter.elementAt(index).add(0, newAssociativityIndex);
    }

    @Override
    public void handleEvent(Event e) {
        if (e.getEventType() == EventType.MemoryRead) {
            handleMemoryReadEvent((MemoryReadEvent) e);
        } else if (e.getEventType() == EventType.MemoryWrite) {
            handleMemoryWriteEvent((MemoryWriteEvent) e);
        } else if (e.getEventType() == EventType.MemoryResponse) {
            handleMemoryResponseEvent((MemoryResponseEvent) e);
        }
    }

    private void handleMemoryReadEvent(MemoryReadEvent event) {
        this.requestingElement = event.getRequestingElement();
        this.address = event.getAddressToReadFrom();

        if (lookup(address)) {
            int data = cacheRead(address);
            implementLRU(data);
            addMemoryResponseEvent(data);
        } else {
            handleCacheMiss(address);
        }
    }

    private void handleMemoryWriteEvent(MemoryWriteEvent event) {
        this.address = event.getAddressToWriteTo();
        this.requestingElement = event.getRequestingElement();
        int data = event.getValue();

        createAndAddMemoryWriteEvent(address, data);
    }

    private void handleMemoryResponseEvent(MemoryResponseEvent event) {
        int value = event.getValue();
        implementLRU(value);
        addMemoryResponseEvent(value);
    }

    private void addMemoryResponseEvent(int value) {
        Simulator.getEventQueue().addEvent(new MemoryResponseEvent(
                Clock.getCurrentTime(),
                this,
                this.requestingElement,
                value));
    }

    private void createAndAddMemoryWriteEvent(int address, int data) {
        Simulator.getEventQueue().addEvent(new MemoryWriteEvent(
                Clock.getCurrentTime() + Configuration.mainMemoryLatency,
                this,
                containingProcessor.getMainMemory(),
                address,
                data));
    }

}