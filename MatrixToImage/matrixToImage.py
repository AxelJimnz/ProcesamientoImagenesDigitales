import numpy as np
from PIL import Image
import matplotlib.pyplot as plt

# Crear una matriz de 400x400 con números aleatorios entre 0 y 255
matrix = np.random.randint(0, 256, size=(400, 400), dtype=np.uint8)

# Crear una imagen a partir de la matriz
image = Image.fromarray(matrix)

# Guardar la imagen como un archivo JPEG
nombre_archivo = "matriz_aleatoria.jpg"
image.save(nombre_archivo)

print(f"Matriz guardada como {nombre_archivo}")

# Obtener el histograma de frecuencia de los píxeles
histograma = np.histogram(matrix, bins=np.arange(0, 257))
frecuencias = histograma[0]

# Crear un gráfico de barras para el histograma
plt.figure(figsize=(10, 6))
plt.bar(histograma[1][:-1], frecuencias, width=1, align='edge', color='blue', alpha=0.7)
plt.title("Histograma de Frecuencia de Píxeles")
plt.xlabel("Valor del Píxel")
plt.ylabel("Frecuencia")
plt.show()
