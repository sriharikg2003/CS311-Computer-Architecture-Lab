import matplotlib.pyplot as plt

y = [0.04233576642,
0.04233576642,
0.04233576642,
0.04233576642]

x = [
    1024,
    512,
    128,
    16
]


plt.plot(x, y, marker='o', color='red', label='Data Points')
name = "Prime"
plt.title(name)
plt.xlabel('L1D Cache Size')
plt.ylabel('IPC')


plt.legend()
plt.grid(True)
plt.savefig('Images/'+name+'2.png')
plt.show()