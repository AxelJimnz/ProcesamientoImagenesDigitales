from PIL import Image
import os
import numpy as np

def get_new_color(used_colors):
    while True:
        new_color = np.random.randint(0, 256, size=3, dtype=np.uint8)
        if tuple(new_color) not in used_colors:
            used_colors.add(tuple(new_color))
            return new_color

# Buscar la imagen binaria en la carpeta
carpeta_destino = "deteccion4-Conexas"
nombre_imagen_binaria = os.path.join(carpeta_destino, "imagen_binaria.jpg")

if not os.path.exists(nombre_imagen_binaria):
    print(f"No se encontró la imagen binaria en {nombre_imagen_binaria}")
else:
    # Cargar la imagen binaria
    imagen_binaria = Image.open(nombre_imagen_binaria)
    
    # Crear una matriz de 4-Conexas con colores no repetidos
    used_colors = set()
    matriz_4conexas = np.zeros((imagen_binaria.height, imagen_binaria.width, 3), dtype=np.uint8)
    
    for i in range(imagen_binaria.height):
        for j in range(imagen_binaria.width):
            pixel_value = imagen_binaria.getpixel((j, i))
            if pixel_value == 0:
                new_color = get_new_color(used_colors)
                matriz_4conexas[i, j] = new_color
    
    # Crear una imagen 4-Conexas a partir de la matriz y guardarla
    imagen_4conexas = Image.fromarray(matriz_4conexas)
    nombre_imagen_4conexas = os.path.join(carpeta_destino, "imagen_4conexas.jpg")
    imagen_4conexas.save(nombre_imagen_4conexas)
    
    print(f"Imagen 4-Conexas generada y guardada como {nombre_imagen_4conexas}")

