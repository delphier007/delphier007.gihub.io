# CSS - Lenguaje de estilos

## Introducción

En este tutorial solo abordaremos los aspectos más relevantes y usuales, como por ejemplo los selectores. Debido a su extensión, no vamos a tocar todas las posibilidades que brinda el lenguaje. También tocaremos los aspectos básicos de Flexbox y CSS Grid.

## CSS esencial

Tomado del curso de EDteam: para dominar CSS es muy importante dominar selectores, especificidad, herencia y cascada. Estos aspectos son los más importantes para una buena cimentación en el conocimiento de CSS.

### HTML y CSS

Los estilos CSS se pueden aplicar de varias formas: en línea, en el documento HTML con etiquetas `<script></script>` o en un archivo `.css` que conectaremos con el HTML mediante una etiqueta `<link>`.

#### En línea

Se pueden aplicar estilos en línea sobre un objeto directamente en el archivo HTML. Veamos el siguiente ejemplo: `<ul style = "color: green;">`. Estamos aplicando mediante el atributo `style` un estilo concreto a una `<ul>`. También podemos aplicar varios estilos:

```html
<div style="background: teal;height: 150px;width: 150px;">HOLA MUNDO!</div>
```

#### Con etiquetas \<style\>

Podemos aplicar estilos a uno o varios elementos del HTML entre las etiquetas `<style></style>`. Estas etiquetas se pueden situar en el `head` o en el `body`. Normalmente se sitúan en el `head` por limpieza. Veamos un ejemplo:

```html
<head>
  <style>
    .rojo {
      background-color: teal;
      height: 200px;
      width: 200px;
    }
  </style>
</head>

<body>
  <div class="rojo" style="background-color: teal; height: 150px; width: 150px;">HOLA MUNDO!</div>
</body>
```

#### Enlazando archivo externo

Los archivos CSS se conectan con el HTML mediante la etiqueta `<link>`. Veamos un ejemplo de un documento html que enlaza un archivo CSS:

```html
<!-- Archivo HTML -->
<head>
  <link rel="stylesheet" href="css/styles.css">
  <!-- En href indicamos la ruta relativa al HTML o la absoluta (no aconsejable)-->
</head>

<body>
  <div class="rojo">HOLA MUNDO!</div>
</body>
```

```css
/* styles.css */
 .rojo {
      background-color: teal;
      height: 200px;
      width: 200px;
    }
```

::: tip NOTA
  En versiones anteriores de HTML, los enlaces a las hojas de estilo debían contener el atributo type con el valor text/css, el tipo MIME correspondiente a las hojas de estilo, pero en HTML 5 no es necesario incluir este atributo.
:::

### Comentarios

Los comentarios en CSS se escriben entre los siguientes delimitadores: `/* */`. Este comentario es multilínea. Como es evidente, al tratarse de un comentario, será ignorado por el navegador.

### Formato reglas CSS

Cada regla CSS está formada por los siguientes elementos:

* Selector: Se definen los elementos a los que se van a aplicar los estilos definidos en el bloque.
* Bloque de declaración: se refiere a todo lo que encontramos entre las llaves `{}`
* Declaraciones: cada una de las sentencias terminadas en `;`. A su vez, las declaraciones están formadas por el par `propiedad: valor`.

Veamos un ejemplo:

```css
/* Esto es un comentario */
/* Los saltos de línea y espacios son ignorados por el navegador a excepción de aquellas propiedades que tienen varios valores que tendrán que estar separados por un espacio.*/
.container {
  background-color: red;
  width: 50%;
  height: 200px;
  margin: 1em 2em; /* El espacio entre los 2 valores es obligatorio */
}
```

### Selectores

Los selectores identifican los elementos a los que se les van a aplicar los estilos que se incluyan en el bloque de declaraciones.

Como norma general, lo ideal para aplicar estilos es utilizando selectorers de *clase* y puntualmente los selectores de *id*. Solo si sabemos lo que estamos haciendo (por ejemplo en un reset), utilizaremos los selectores de etiqueta, ya que estos estilos se aplicarían a **todos** los elementos de ese tipo, lo cual puede ser peligroso.

#### Estilos predeterminados del navegador

Hay que tener en cuenta que los elementos HtML ya disponen de unos estilos básicos que establece el propio navegador (user agent). Por tanto, es buena idea resetear los estilos del navegador para que no nos afecten a los estilos propios. Se puede hacer manualmente dejando los estilos en cero (* selecciona a todos los elementos) o mediante reset.css:

```css
* {
  margin: 0;
  padding: 0;
  list-style: none;
  text-decoration: none;
  border: none;
  outline: none;
}
```

Actualmente es **preferible** utilizar [Normalize](http://necolas.github.io/normalize.css/), que es una hoja de estilos (desarrollada por Nicolas Gallagher) que cumple una funcion muy similar al reset, donde en lugar de dejar los estilos en cero, se encarga de que los estilos base sean iguales en todos los navegadores, entoces sólo deberemos modificar aquellos elementos que sea necesario desde el punto de vista de nuestro diseño y el resto se mostrará con un estilo estándar.

#### Selectores de etiqueta

Se conforman indicando el nombre de las etiquetas HTML/XML. En el siguiente ejemplo se seleccionan las etiquetas h1, h3 y p.

```css
h1, h3 {
  background-color: red;
}

p {
  color: teal;
}
```

#### Selectores de clase

Es lo más recomendado para aplicar estilos ya que podemos definir estilos base para una clase determinada e ir aplicándosela a cualquier elemento que nos convenga en dicho momento. El selector de clase comienza por un punto seguido del nombre_clase. Veamos un ejmplo:

```html
<h1 class="title center">Esto es un título</h1>
<h2 class="bold center">Esto es un h2</h2>

<P>Lorem ipsum dolor, sit amet consectetur adipisicing elit. Autem sit porro dolorum earum perspiciatis recusandae.</P>
```

```css
.bold {
  font-weight: bold;
}

.center {
  text-align: center;
}
```

::: tip VARIAS CLASES
Podemos seleccionar elementos que tengan más de una clase uniéndolas **sin espacios**. Ejemplo: `.clase1.clase2 {[sentencias]}`
:::

::: warning CLASES
Recordamos que las clases **no** pueden empezar por un número!
:::

#### Selectores de ID

Seleccionan al elemento cuyo ID corresponda con el selector indicado. Los selectores de ID cominezan con el un `#`. Estos selectores **no son reutilizables** ya que, como es evidente, los IDs son únicos por lo que solo se aplicaran a un elemento HTML concreto. No es recomendable su uso en CSS (sí en JS).

```css
#parrafo {
  color: green;
}
```

#### Selector universal

Como su nombre indica, el selector universal aplica los estilos establecidos a **todos** los elementos HTML. Salvo para el RESET comentado anteriormente o aplicar propiedades que queremos que sean universales. Ejemplo:

 ```css
 * {
   box-sizing: border-box;
 }
 ```

#### Case in/sensitive

Los selectores en CSS son *case insensitive* pero dependen del lenguaje al que se aplican. En el caso del HTML, las etiquetas son *case insensitive* pero **no** así los atributos. Veamos el siguiente ejemplo:

```html
<P class="Parrafo">Lorem ipsum dolor, sit amet consectetur adipisicing elit.</P>

<p id="parrafo">Deserunt aliquid itaque deleniti similique eos nesciunt!</p>
```

```css
/*Solo se aplicaría al primer párrafo*/
.Parrafo {
  color: red;
}

/*Se aplica a ambos párrafos*/
P {
  background-color: #ccc;
}
```

#### Selectores agrupados

Se consiguen cuando establecemos más de un selector a la vez. El caso más sencillo es aquel en el que agrupamos mediante la `,` (coma). Se recomienda una línea diferente por cada selector.

```html
<h1>Esto es un título</h1>
<h2>Esto es un h2</h2>

<P class="Parrafo texto">Lorem ipsum dolor, sit amet consectetur adipisicing elit.</P>

<p id="parrafo">Deserunt aliquid itaque deleniti similique eos nesciunt!</p>
```

```css
#parrafo,
.Parrafo {
  color: teal;
}

h1,
h2,
#parrafo,
.texto {
  text-align: center;
}
```

#### Selectores descendientes

Son todos aquellos elementos que son descendientes de un elemento dado. Con descendientes nos referimos a cualquier nivel (hijos, nietos, bisnietos, ...).

Se declaran como `selector_padre selector_descendiente_cualquier_nivel`. Pueden existir varios niveles de anidamiento. Veamos varios ejemplos:

```html
<section class="primero">
  <div class="segundo">
    <p class="tercero">
      Lorem ipsum dolor sit amet consectetur <span class="cuarto">adipisicing elit</span>. Magnam, ab quae! Ipsa sed ipsum id!
    </p>
  </div>
</section>
```

```css
section {
  height: 500px;
  width: 500px;
  background-color: #ccc;
}

div {
  height: 200px;
  width: 200px;
}
/*Cualquier elemento que tenga la clase .segundo que sea descendiente de un elemento con la clase .primero*/
.primero .segundo {
  background-color: yellow;
}
/*Cualquier elemento con la clase .tercero que sea descendiente de un elemento con la clase .segundo que a su vez sea descendiente de la clase .primero*/
.primero .segundo .tercero {
  background-color: teal;
}
/*/*Cualquier elemento que tenga la clase .cuarto que sea descendiente de un elemento con la clase .primero. En este ejemplo vemos que no tiene que ser descendiente directo.*/
*/
.primero .cuarto {
  font-weight: bold;
}
```

::: warning ESPECIFICIDAD
No es recomendable utilizar los selectores descendientes salvo contadas ocasiones ya que pueden verse afectados por la **especificidad** y dar problemas es estilos que se sobreescriban. Es mejor, como siempre, usar clases.
:::

::: danger VARIAS CLASES
**No confundir** con el selector de varias clases. Se debe dejar un espacio entre los selectores.
:::

```css
.clase1.clase2 {
  /*Se aplica a elementos con las dos clases,
  no a elementos con la clase2 que sean descendientes de algún elemento con clase1*/
}

ul.list {
  /*Se selecciona un elemento ul con la clase list*/
}
```

#### Selector hijo directo

Con este selector elegimos a los elementos que son hijos directos de otro elemento. A diferencia del selector descendiente, en este caso tiene que ser el primer nivel, **no** cualquier nivel (nieto, bisnieto,...).

Se forma indicando `elemento_padre > elemento_hijo_directo`. Veamos un ejemplo:

```css
.list > .list-item {
  /*elemtnos con la clase list-item que sean hijos directos de un elemento con la clase list*/
}

ul > li {
  /*Elementos li que sean hijos directos de un elemento ul*/
}
```

#### Selector hermano siguiente o adyacente

Este selector hace referencia al elemento *hermano* justo siguiente al primer selector. Se unirán con un símbolo `+` como sigue: `elemento_anterior + elemento_afectado`.

```html
<p class="hermano-mayor">Primero</p>
<p>Segundo</p>
<p>Tercero</p>
```

```css
p.hermano-mayor + p {
  color: red; /*El segundo párrafo será el afectado*/
}
```

#### Selector hermanos siguientes o adyacentes

Este selector hace referencia a los elementos *hermanos* **siguientes** al primer selector. Se unirán con un símbolo `~` como sigue: `elemento ~ elementos_afectados`.

```html
<span>Este span no es rojo.</span>
<p>Aquí hay un párrafo.</p>
<code>Aquí hay algo de código.</code>
<span>Aquí hay un span. Es rojo porque va precedido de un párrafo y ambos comparten el mismo padre.</span>
```

```css
p ~ span {
  color: red;
}
```

#### Selectores de atributos

Como su nombre indica, seleciona elementos por algún atributo. Los atributos se puden indicar de varias formas:

```css
/*Tiene el atributo=valor */
[type="text"] {
  /*Se aplica a los elementos cuyo tipo sea texto. P.e.: input type="text"*/
}

/* Tiene el atributo... */
[required] {
  /*Se aplica a los elementos que lleven el atributo required*/
}
/* Atributo comienza con */
[href^="/"]{
  /*Se aplica a todos los links cuyo href comience con /. Así podemos saber si es un enlace local o externo.*/
}
/* Atributo termina con */
[href$=".pdf"] {
  /*Se aplica a todos los links cuyo valor termine en pdf. */
}
/* Atributo contine */
[class*="parrafo-"] {
  /* Selecciona todos los elementos que contengan en su clase parrafo-. Por ejemplo: parrafo-primero, parrafo-último, parrafo-bold ... */
}
/* Atributo contine (separado por espacios) */
[class~="clase"]{
  /*
  <p class="clase primeraclase">Primero</p>
  <p class="primeraclase">Segundo</p>
  <p class="">Tercero</p>
  */
  /*Se podría hacer con selector de clase igual a clase pero no se me ocurre otro ejemplo*/
}
/* Atributo comienza con (más guión) */
[class="button"] {
  /* Equivale a class^="button-" */
  /* Tiene su utilidad para los estilos como los de boostrap, materialize, etc: text-danger, text-succsess o algo así...*/
}
```

<!-- Final CSS esencial -->

## Pseudoelementos

## Variables CSS

Las variables CSS se deben declar dentro de un bloque (:root, body, etc..). Los habitual y recomendado es declarlo dentro del bloque del selector `:root`. Hay que tener en cuenta que no se pueden declarar en cualquier lugar del archivo (fuera de un bloque `{}`).

Las variables se declaran así: `--nombre_variable: valor_variable`. Y para utilizarlas utilizaremos la función `var(--nombre_variable)`. Veamos un ejemplo:

```css
:root {
  --color: red;
}

body {
  background-color: var(--color);
}

h1 {
  background-color: white;
  color: var(--color);
}
```
<!-- TODO: ver curso de EDteam para completar. Link: https://ed.team/cursos/variables-css -->

## Flexbox

## CSS Grid
