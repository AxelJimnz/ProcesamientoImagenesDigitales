import numpy as np
from PIL import Image

def mostrar_matriz(matriz):
    for fila in matriz:
        print(" ".join(f"{valor:3}" for valor in fila))

# Crear una matriz de 400x400 con números aleatorios entre 0 y 255
matrix = np.random.randint(0, 256, size=(400, 400), dtype=np.uint8)

# Mostrar la matriz en la consola
print("Matriz generada:")
mostrar_matriz(matrix)

# Crear una imagen a partir de la matriz
image = Image.fromarray(matrix)

# Guardar la imagen como un archivo JPEG
nombre_archivo = "matriz_aleatoria.jpg"
image.save(nombre_archivo)

print(f"\nMatriz guardada como {nombre_archivo}")
