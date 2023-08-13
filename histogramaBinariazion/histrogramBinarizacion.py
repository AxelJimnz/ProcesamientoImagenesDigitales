import numpy as np
from PIL import Image
import matplotlib.pyplot as plt

def mostrar_matriz(matriz):
    for fila in matriz:
        print(" ".join(f"{valor:3}" for valor in fila))

# Crear una matriz de 400x400 con números aleatorios entre 0 y 255
matrix = np.random.randint(0, 256, size=(400, 400), dtype=np.uint8)

# Crear una imagen a partir de la matriz
image = Image.fromarray(matrix)

# Guardar la imagen original como un archivo JPEG
nombre_archivo_original = "matriz_aleatoria.jpg"
image.save(nombre_archivo_original)

print(f"Matriz guardada como {nombre_archivo_original}")

# Obtener el histograma de frecuencia de cada pixel de la imagen generada
histograma = image.histogram()

# Convertir el histograma en una gráfica
plt.figure(figsize=(10, 5))
plt.bar(range(256), histograma[:256], color='b', alpha=0.7)
plt.xlabel('Valor del píxel')
plt.ylabel('Frecuencia')
plt.title('Histograma de la imagen generada')
plt.show()

# Recorrer la imagen y aplicar umbralización
umbral = 120
imagen_salida = Image.new("L", image.size)

for y in range(image.height):
    for x in range(image.width):
        pixel = image.getpixel((x, y))
        nuevo_valor = 0 if pixel > umbral else 255
        imagen_salida.putpixel((x, y), nuevo_valor)

# Guardar la imagen umbralizada como un archivo JPEG
nombre_archivo_umbralizada = "imagen_umbralizada.jpg"
imagen_salida.save(nombre_archivo_umbralizada)

print(f"Imagen umbralizada guardada como {nombre_archivo_umbralizada}")
