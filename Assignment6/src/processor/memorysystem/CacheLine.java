package processor.memorysystem;


public class CacheLine {

    Integer tagID;
    Integer data;
    int isLineEmpty;

    CacheLine(){
        this.isLineEmpty = 1;
    }
    
    public int isEmpty() {
		return isLineEmpty;
	}

	public void setEmpty(int isLineEmpty) {
		this.isLineEmpty = isLineEmpty;
	}
    
    public Integer getTag() {
        return tagID;
    }
    public void setTag(Integer tagID) {
        this.tagID = tagID;
        setEmpty(0);
    }
    public Integer getData() {
        return data;
    }
    public void setData(Integer data) {
        this.data = data;
    }


}
