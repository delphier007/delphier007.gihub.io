# Conceptos de Javascript

## Introducción

<!-- <div class="warning custom-block">
  <p class="custom-block-title">Note</p>
  <p>You should ONLY write color variables in this file. since <code>palette.styl</code> will be imported at the end of the root stylus config file, as a config, it will be used by multiple files, so once you wrote styles here, your style would be duplicated by multiple times.
  </p>
</div> -->
<!-- la forma fácil -->

::: tip AVISO
will be imported at the end of the root stylus config file, as a config, it will be used by multiple files, so once you wr
:::

::: warning ATENCIÓN
will be imported at the end of the root stylus config file, as a config, <badge type="tip" text="Hola Picón"/> it will be used by multiple files, so once you wr
:::

::: danger MUY IMPORTANTE
will be imported at the end of the root stylus config file, as a config, it will be used by multiple files, so once you wr
:::

<!-- badge -->

### Badge <Badge text="beta" type="warn"/> <Badge text="0.10.1+"/> <Badge text="default theme"/>

<badge text="Holasss" type="warn" vertical="middle"/>
<!-- vertical: top|middle      type: tip|warn|error -->
<!-- https://v1.vuepress.vuejs.org/guide/using-vue.html#built-in-components -->
<!-- emojis -->
:100: :tada: :1234: :innocent:

Los archivos Markdown son convertidos a HTML y luego pasados como un componente de Vue. Por tanto, se pueden realizar interpolaciones. Ejemplos:

{{ 1+1 }}

<span v-for="i in 5">{{ i }} </span>

::: v-pre
`{{ This will be displayed as-is }}`
:::

<style lang="scss" scoped>
div {
  .boton {
    background-color: lime;
    color: red
  }
}
</style>

Hola  esto es un <div><button class="boton">Hola</button></div>
<a href="/guia/" class="action-button">Comenzar aquí</a>
<!-- <p>Estamos en la página {{ $page }}</p> -->

Estamos en la página {{ $page.title }}
