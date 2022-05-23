# Ideas a plantear para mejorar el código

## Uso de los Registros

* x0 -> **Color**
* (x1,x2) , (x3,x4) -> **Van a marcar pares de puntos en vista del framebuffer como una grilla**
* x28 -> **SP -> Stack Pointer**
* x29 -> **FP -> Frame Pointer. Se pone la dirección base del framebuffer**
* x30 -> **Direcciones para los return de las funciones**

## Funciones para creación de figuras

La idea sería que estas estén todas juntas en un **archivo aparte**, como por ejemplo **[formas_geometricas.s]**

### Dibujar pixel

Dándole `xo` y `(x9,x10)` como argumentos, pinta el pixel correspondiente a
```
x12 = x29 + 4 * (x10 * LARGO_PANTALLA + x9)
```
del color dado por `x9`