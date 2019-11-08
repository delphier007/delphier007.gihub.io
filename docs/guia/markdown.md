# MARKDOWN

## Introducción

Se trata de un lenguaje de marcado ligero creado por John Gruber que trata de conseguir la máxima legibilidad y facilidad de publicación tanto en su forma de entrada como de salida, inspirándose en muchas convenciones existentes para marcar mensajes de correo electrónico usando texto plano.

## Títulos h1-h6

Los títulos se forman iniciando con "#" acompañado de un espacio. Los títulos desde h1 hasta h6 se generan incluyendo un número igual de "#". Veamos el ejemplo:

``` md
# Esto es un h1
## Esto es un h2
### Esto es un h3
#### Esto es un h4
##### Esto es un h5
###### Esto es un h6
```

## Estilos (negritas y cursivas)

Las palabras o frases en *cursiva* se escriben entre asteriscos. Las **negritas** se forman entre dos asteriscos. Y la ***cursiva-negrita*** con tres asteriscos.

## Párrafos

Los párrafos se forman simplemente escribiendo el párrafo tal cual. Solo hay que separarlos de su anterio o posterior mediante una línea en blanco.

Si dejamos un SOLO ESPACIO y damos un retorno de carro sigue siendo el mismo párrafo y la misma línea.  
Pero si dejamos 2 ESPACIOS Y UN RETORNO DE CARRO estamos en el mismo párrafo pero con salto de línea. Visualmente no se deferencia de dos párrfos pero sí son diferentes en el HTML de la página generada.

```md
"Andando con sus patitas mojadas,  
el gorrión  
por la terraza de madera"
```

## Listas desordenadas

Para generar listas desordenadas podemos utilizar los siguientes caracteres: `*, + y -` al inicio de cada item. Los subniveles se forman añadiendo una tabulación.

```md
* Generado con *
+ Generado con +
- Generado con -
  * Subnivel con un TAB
```

## Listas ordenadas

Las listas ordenadas se generan numerando con el dígito y un punto. Veamos un ejemplo:

```md
1. Uno
2. Dos
3. Tres
```

```md
1. Primer nivel
    1. Subnivel (con 4 espacios o 2TABs si se tiene configurado en VS Code como TAB=2 espacios). Recomendado utilizar los espacios.
    2. Subnivel
        * Se pueden combinar listas sin ordenar y ordenadas
        * En esta vamos a hacer otro nivel ordenado
    3. Con más subniveles ordenados
        1. Otro elemento
        2. Otro más
            1. Otro subnivel más
            2. Otro subnivel más
        3. Y otro más
            1. El último
2. Segundo item

<!-- Comentario pariniciar la nueva lista, ya que si no continúa con la numeración (3) -->
1. Nueva numeración
```

Este es el resultado del código anterior:

1. Primer nivel
    1. Subnivel (con 4 espacios o 2TABs si se tiene configurado en VS Code como TAB=2 espacios). Recomendado utilizar los espacios.
    2. Subnivel
        * Se pueden combinar listas sin ordenar y ordenadas
        * En esta vamos a hacer otro nivel ordenado
    3. Con más subniveles ordenados
        1. Otro elemento
        2. Otro más
            1. Otro subnivel más
            2. Otro subnivel más
        3. Y otro más
            1. El último
2. Segundo item

<!-- Comentario para reiniciar la nueva lista -->
1. Nueva numeración

## Subrayados

Las líneas horizontales se forman con 3 o mas símbolos: asteriscos, guiones o guiones bajos (sirve con espacios o sin ellos).

```md
---
***
___

* * *
```

## Citas (blockquote)

Las citas se crean con el símbolo `>` colocándolo al principio de cada una de las líneas de la cita. Esto genera un ***blockquote***. Si a alguna línea se le ponen dos símbolos `>>` se convierte en una cita anidada.

```md
> Las citas se crean con el símbolo
> MAYOR QUE colocándolo al principio de
> cada una de las líneas de la cita. Esto genera
> un ***blockquote***
>
>> Esto es una cita anidada a la principal
>
> Esta no está anidada.
```

Resultado:

> Las citas se crean con el símbolo
> MAYOR QUE colocándolo al principio de
> cada una de las líneas de la cita. Esto genera
> un ***blockquote***
>
>> Esto es una cita anidada a la principal
>
> Esta no está anidada.

## Insertar código en línea y de bloque

Para escribir código in-line (esiquetas **code**) utilizamos los backticks ` `` `. Este es un ejemplo de código en línea: `<p>Esto es un párrafo</p>`.

Los bloques de código (etiquetas **pre + code**) se forman con tres tildes `~~~` o con tres backticks ` ``` ` para el inicio y para el final. En esta página se pueden ver muchos ejemplos de bloques de código. Tambien se puede poner el lenguaje que hay en el interior del bloque tras los primeros tres tildes o backticks. Se puede indicar el lenguaje o la abreviatura: javascript o js / markdown o md, y así.

````html
<!doctype html>
...
<p class="principal">lorem ipsum</p>
````

## Enlaces

### En línea

Esto es un enlace: [Link](https://markdown.es/sintaxis-markdown/)

```md
Esto es un enlace: [Link](https://markdown.es/sintaxis-markdown/)
```

### Enlaces por referencia

Se utilizan cuando tenemos muchos enlaces con el mismo destino (link) 0 cuando son muy largos. Estos enlaces se agrupan normalmente al final de la página.

Lorem ipsum dolor sit [enlace] amet consectetur adipisicing elit. Enim dolorum et quos [otro][enlace] nesciunt perspiciatis veritatis iure sapiente, nostrum omnis nihil accusantium id, [más][enlace] aliquam deserunt eos placeat expedita, [enlace] aperiam rerum eveniet!

[enlace]: https:google.es

```md
Lorem ipsum dolor sit [enlace] amet consectetur adipisicing elit.  
Enim dolorum et quos [otro][enlace] nesciunt perspiciatis veritatis iure
sapiente, nostrum omnis nihil accusantium id, [más][enlace] aliquam  

//Final página
[enlace]: https:google.es
```

### Enlaces automáticos

Es cuando quieres que el enlace no se enmascare en otra palabra, si no que aparezca tal cual. Por ejemplo: <https://google.es>

```md
Ejemplo de enlace automático: <https://google.es>
```

## Imágenes

Insertar una imagen es idéntico a los enlaces pero con el símbolo de `!` al principio del enlace.

![Texto alternativo para la imagen](https://picsum.photos/800/100 "Título al poner el ratón sobre la imagen")

```md
![Texto alternativo para la imagen](https://picsum.photos/800/100 "Título al poner el ratón sobre la imagen")
```

## Caracteres especiales (asterisco, guiones, almohadilla, etc...)

Lo haremos insertando la `\` delante del símbolo en cuestión. Por ejemplo podemos esctibir la \# (`\#`).

Para escribir párrafos con una clase asignada tendremos que insertar HTML directamente en el MD.

```md
<p class="clase">
Para escribir párrafos con una clase asignada tendremos que insertar HTML directamente en el MD.
</p>
```

## Tablas

Para las tablas utilizamos tres guiones para cada campo separados con un PIPE `|`. Los pipes de inicio y final no hacen falta pero son más estéticos. Con los `:` alineamos a izq/centro/derecha.

|Campo 1 | Campo 2 | Campo 3|
|:---|:---:|---:|
Texto 1 | 12/10/2008 | 25,30 €
Otro texto | 01/12/2009 | 15,25 €
Último texto | 25/03/2012 | 7,15 €

```md
|Campo 1 | Campo 2 | Campo 3|
|:---|:---:|---:|
Texto 1 | 12/10/2008 | 25,30 €
Otro texto | 01/12/2009 | 15,25 €
Último texto | 25/03/2012 | 7,15 €
```

## Markdown-it plugins

::: danger markdown-it-math
Debería funcionar este plugin pero por ahora no hay forma. En fin...
:::

$$\sqrt{c^2=a^2 + b^2}\div2$$
