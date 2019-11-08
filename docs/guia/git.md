# GIT - CONTROL DE VERSIONES

## Confirguración del proyecto

Al hacer el primer `git commit` nos solicitará nuestras credenciales si no lo hemos configurado anteriormente con los siguientes comandos:

```sh
git config --global user.email "email@example.com"
git config --global user.name "Your name"
```

En todos los proyectos habrá carpetas y/o archivos que queramos que *GIT* ignore, tales como archivos de pruebas o de configuración no necesarios en el proyecto final, o carpetas como *node_modules*, etc.

Para ello, creamos un archivo llamado `.gitignore`, y en el incluimos los nombres de las carpetas (no llevan extensión) y de los archivos que queramos ignorar. Es decir, `git estatus` no nos notificará nada a cerca de ellos. El propio archivo `.gitignore` sí debemos incluirlo con `git add .gitignore`.

Este archivo podría tener una información parecida a esta:

```sh
node_modules
prueba
texto.txt
```

## Zonas / Estados de GIT

### Working directory

Es la carpeta de trabajo que estará controlando **git** y donde tendremos los archivos del proyecto.

### Staging area

Es la carpeta donde se añaden los archivos que estarán preparados para hacer un guardado (*commit*). Esto se hace con el comando `git add`.

### Repository

Es la carpeta donde se guardan definitivamente los archivos que se encontraban en el ***staging area*** cuando hacemos un guardado o `git commit`

## Comando básicos de GIT

### git init

El comando para iniciar el control de versiones es `git init`. Con esto le decimos a git que comience a contrar las versiones del proyecto. Podremos ver que se ha creado la carpeta `.git`. Esta carpeta es **oculta**.

### git status

El comando `git status` nos da información del estado de los archivos en sus diferentes estados. Si se han agregado al *staging area* o si están pendientes de ser agregados.

### git add

Con este comando añadimos los archivos deseados desde el *working area* al *staging area*. Para añadir por un archivo concreto utilizamos `git add index.html`. Tras utilizar este comando podemos `git status` para ver que este archivo ya se encuentra preparados para enviar al repositorio con el comando `git commit`.

Para evitar estar añadiendo archivos uno a uno podemos utilizar el comando `git add .` para añadir todos los archivos del proyecto. Se ignoran las carpetas vacías.

### git commit

Cuando se ejecuta `git commit` se hace un guardado de los archivos que estaban en el *staging area* al repositorio. Ahora tenemos una *fotografía* del estado de todos los archivos en un momento concreto. Los *commits* se guardan con un código SHA (Secure Hash Algorithm) y podemos volver a ellos en cualquier momento ya que se identifican con dicho *hash*.

Al hacer un `git commit` habrirá un editor de código para introducir el mensaje que acompaña a cada *commit*. Para evitarlo podemos escribir el comando incluyendo directamente el mensaje. A saber:

```sh
git commit -m "Este es el mensaje para este commit"
```

Tras un *commit* el *staging area* queda vacía y si hacemos un `git status` nos indicará *Nothing to commit: working tree clean*. Y volvemos a empezar a añadir archivos con `git add` al *staging area* hasta hacer un nuevo *commit*.

Hay que tener en cuenta que si yo modifico el archivo *index.html* y hago un `git add index.html` y luego vuelvo a cambiar algo en *index.html*, al hacer un *commit* se guardará la primera modificación ya que los archivos modificados deben ser preparados en el *staging area* con el comando *add*.

Este paso podemos acortarlo añadiendo el modificador `-a` al comando de guardado. Es decir:

```sh
git commit -a -m "Hago un commit añadiendo los archivos modificados sin tener que hacer git add previamente.
```

Se ha de tener en cuenta que los archivos que no hayan sido TRACKED hasta el momento, no se incluyen con este shortcut. Habría que hacer antes `git add .` para que se incluyan.

Si hacemos un *commit* y nos percatamos de que falta alguna cosa, queremos modificar el mensaje o no hemos introducido algún archivo (debemos utilizar previamente `git add file.ext` o `git add .` si lo queremos meter todo lo modificado) podemos volver momentáneamente atrás con `git commit --amend`. Concretamente lo que hace es añadir las modificaciones que queramos añadir sin hacer un nuevo commit (cambia el hash ya que es uno nuevo que *sustituye* al anterior). SOLO SIRVE con el último commit realizado.

### git log

Con este comando obtenemos un resumen de los *commits* realizados hasta el momento. En el listado aparecen con sus códigos SHA y podemos gestionarlos identificándolos con dicho *hash*. El *commit* que indica `(HEAD -> master)` es el *commit* actual en la rama que estemos. En este caso estamos en la principal (*Master*).

Si existen muchos *commits* y queremos limitarlos podemos introudcir el modificador `--since`, `--before` o `--after` con la fecha para limitar la lista de salida `-5` para listar los últimos 5. El siguiente ejemplo lista desde el 2008/10/01 al 2008/11/01. Veamos:

```sh
git log --since="2008-10-01" --before="2008-11-01"
```

También hay flags útiles como:

```sh
git log --oneline --decorate --graph
```

El modificador `--all` muestra los *commit* de todas las ramas. Por defecto (sin --all) muestra los de la rama activa.

### git stash

Este comando tiene cierta complejidad. Este [enlace](https://git-scm.com/book/es/v1/Las-herramientas-de-Git-Guardado-r%C3%A1pido-provisional) contine una explicación más detallada.

Según se está trabajando en un apartado de un proyecto, normalmente el espacio de trabajo suele estar en un estado inconsistente. Pero puede que se necesite cambiar de rama durante un breve tiempo para ponerse a trabajar en algún otro tema urgente. Esto plantea el problema de confirmar cambios en un trabajo medio hecho, simplemente para poder volver a ese punto más tarde. Y su solución es el comando 'git stash'.

Este comando de guardado rápido (stashing) toma el estado del espacio de trabajo, con todas las modificaciones en los archivos bajo control de cambios, y lo guarda en una pila provisional. Desde allí, se podrán recuperar posteriormente y volverlas a aplicar de nuevo sobre el espacio de trabajo.

Lo más básico es hacer `git stash` y los trabajos pendientes se guardan en una pila de donde más tarde se puede recuperar el estado anterior con `git stash apply`.

Las modificaciones sobre los archivos serán aplicadas; pero no así el estado de preparación. Para conseguir esto último, es necesario ejecutar `git stash --index`. Con ello se le indica que debe intentar reaplicar también el estado de preparación de los archivos. Y asi se puede conseguir volver exactamente al punto original. Luego habría que hacer un `git stash drop stash@{0}` donde 0 es el índice que aparece en `git stash list`.

También es posible utilizar el comando git stash pop, que aplica cambios de un guardado y lo retira inmediatamente de la pila.

### Alias

Podemos crear un alias para un comando, con o sin modificadores, que utilicemos a menudo para escribir menos. Por ejemplo:

```sh
git config --global alias.co checkout
git config --global alias.br branch
git config --global alias.ci commit
git config --global alias.st status
```

Uno muy útil sería:

```sh
git config --global alias.lod 'log --oneline --decorate'
```

Podemos usar el alias añadiendo otros modificacdores ya que lo único que hace un alias es cambiar el nombre corto por el comando completo. Ver la segunda línea

```sh
git lod --all
```

Para eliminar un *alias* ejecutaríamos el siguiente comando:

```sh
git config --global --unset alias.co
```

### git checkout

Con este comando se puede cambiar el estado actual de los archivos del *working directory* por el ***capturado*** en cualquier *commit* que se haya hecho.

Por ejemplo, si modificamos el archivo `index.html` y ejecutamos el comando `git checkout -- index.html`, revertiremos los cambios efectuados en este archivo volviendo a la copia guardada en el último *commmit*. Siempre que no esté en el *staging area*. Si es el caso, primero tenemos que hacer un *unstage* del archivo utilizando el comando: `git reset HEAD file`. Ahora estará en el *working directory* y prodermos deshacer los cambios con `git checkout -- file`.

Con `git checkout rama` podemos movernos a la rama cuyo nombre hemos indicado (sustituir rama por el nombre real).

### git diff

Con el comando `git diff file.ext` podemos ver las diferencias entre el archivo guardado en el último *commit* y el archivo actual. Mostrará un listado con las líneas eliminadas (con el signo -) y las filas añadidas (con el signo +).

También podemos ver las diferencias entre dos commits utilizando sus hashes o `git diff HEAD~1 HEAD` para ver las diferencias entre el último y el penúltimo.

### git branch

Para la creación de ramas en el proyecto utilizamos `git branch rama`, donde rama es el nombre que se le da a la variación de la rama principal (master). Con `git branch` obtenmos un listado de las ramas existentes y resaltada tendremos la rama en la que estamos actualmente. Esto nos permite tener versiones alternativas de nuestro código y, en su caso, fusionarla finalmente con la rama *master* si hemos comprobado que los cambios son correctos y y queremos finalmente volverlos definitivos.

También existe un atajo para crear una rama y cambiarnos a ella directamente. Se hace con el siguiente comando: `git checkout -b nombre_rama`.

### git merge

El comando `git merge` sirve para fusionar dos ramas. Normalmente una paralela con la master. En primer lugar tienes que situarte en la rama que va a "absorver" a la otra rama (normalmente la rama master).

```sh
git checkout master // Nos colocalmos en la rama master
git merge nombre_rama // Nos traemos los cambios de la rama nombre_rama a master.
```

Para ver más opciones del comando tendremos que revisar la documentación oficial.

## Trabajar con repositorio remoto

### git remote

Ha llegado el momento de compartir nuestros archivos con un repositorio en remoto (Github, Gitlab, etc..). Para ello utilizaremos la primera vez el comando `git remote add <name> url_remota` donde la *url_remota* es la del repositorio remoto.

Con el siguiente código creamos el enlace con el repositorio remotor y enviamos el *commit* que estemos revisando (lo normal es que sea el HEAD->master). Así que utilizaremos los siguientes comandos:

```sh
git remote add origin https://github.com/Delphier007/markdown
git push -u origin master
```

### git clone

Con este comando podemos clonar un repositorio remoto, por ejemplo, si lo hemos perdido o estamos en otra computadora. O clonar el repositorio público de otro programador. También se puede bajar un `.zip`.

```sh
git clone https://github.com/Delphier007/markdown
```

### git push

Con el comando `git push origin nombre_rama` enviamos los cambios realizados al repositorio remoto. Si utilizamos `git push origin --all` subimos TODOS los cambios del repositorio.

Añadir que con `git push origin :rama` eliminamos la rama del remoto, ya que con `git branch -d rama` se borra en local y al hacer `git push --all` no se borra dicha **rama** del repositorio. Si quisiéramos hacer `push` de una rama local en una rama remota con otro nombre (exista o no) haríamos: `git push origin rama:otra_rama`.

### git fetch

Este comando básicamente lo que hace es preguntar a un remoto si hay *novedades* en el remoto y descargarlas localmente.

Si hay modificaciones lo que hará es descargar las modificaciones en el remoto dentro de la rama en la que estemos. Si es la rama *master* descargará la rama *origin/master*.

Ahora si ejecutáramos `git merge orign/master` tendríamos el mismo resultado que si hubieramos hecho directamente `git pull origin master`.

### git pull

Comando que trae los cambios desde el repositorio remoto y los fusiona en el local. Realmente, es un comando que hace un `git fetch...` y luego un `git merge ...`.
Se puede utilizar por ejemplo: `git pull origin` o `git pull origin master`.

Cuando hay conflictos, y se resuelven por el método recursivo, tendremos que hacer un muevo commit que lo arregle pero aparecerá en el historial. Por eso, una buena forma de solucionarlo (a veces) es con `git pull --rebase`. El subcomando *--rebase* intenta rehacer el historial para ir "mezclando" los *commit* e intentar hacer una fusión organizada que no requiera un nuevo *commit* al haber conflictos.

Más adelante, se trata del comando REBASE en produncidad.

## Deshaciendo cambios

### git commit --amend

Ver apartado correspondiente en el comando [**COMMIT**](#git-commit).

### git checkout -- file

Ver apartado en el comando [**CHECKOUT**](#git-checkout).

### git reset

Con reset podemos deshacer cambios de varias formas. Se ha de tener en cuenta que **son cambios destructivos!**.

Este comando es útil para deshacer cambios en **local**, pero es muy peligroso eliminar uno o varios *commit* del repositorio compartido, ya que pueden aparecer conflictos importantes con otros programadores. En ese caso es mucho mejor utilizar el comando ***revert*** que, al contario que **reset**, no es destructivo (genera un nuevo *commit* que podría ser revertido si fuese necesario.)

+ Podemos hacer un *unstage* de un archivo (devolverlo al *working directory*) para poder hacer, por ejemplo, un `git checkout -- file`, para ello debemos hacer previamente `git reset HEAD file`.
  
+ GIT RESET (deshace el *commit* y conserva los cambios en los archivos y los quita del *staging area*): Si queremos revertir todo a un *commit* anterior (**cuidado que es irreversible!**), podemos utilizar el siguiente comando: `git reset hash`, donde *hash* es el identificador que nos da el log del *commit* al que queremos regresar. También podemos utilizar el mismo comando anterior pero utilizando los identificadores relativos *HEAD*. Por ejemplo: `git reset HEAD`. Con este comando lo que hacemos es *realmente* un *unstage* de los archivos modificados que estaban en el *staging area*. Si por ejemplo hacemos un `git reset HEAD~1` o `git reset HEAD~2` entonces devolvemos el *working area* al estado tras el penúltimo o antepenúltimo *commit* pero los archivos **modificados** posteriormente a dicho *commit de destino* siguen modificados y se sacan del *stage*. Si algún archivo se añadió por primera vez con *add* volverá a estar *untracked*.

+ GIT RESET --soft: nos devuelve al *commit* indicado y **no destruye** los cambios realizados posteriormente, dejándolos en el *staging area*. Por ejemplo:

```sh
git reset --soft HEAD~1
```

+ GIT RESET --hard: nos devuelve al *commit* indicado pero **destruye** los cambios realizados posteriormente (eliminando archivos creados despues de ese commit). **Cuidado!**. Por ejemplo:

```sh
git reset --hard HEAD~1
```

Si nos arrepentimos seguidamente y no hemos limpiado la consola. Podemos hacer un `git checkout <hash eliminado>`.

```sh
Picon@DELL MINGW64 /f/Programación/CURSOS/TypeScript ((a060db5...))
$ git lod
a060db5 (HEAD) git de prueba para un reset
e73494f (master) Commit inicial para hacer luego una prueba (hecha)

/*------- TRAS ARREPENTIRNOS---------*/

Picon@DELL MINGW64 /f/Programación/CURSOS/TypeScript ((e73494f...))
$ git checkout a060db5
Previous HEAD position was e73494f Commit inicial para hacer luego una prueba (hecha)
HEAD is now at a060db5 git de prueba para un reset
```

Pero hay que tener CUIDADO. Ahora estamos como en una rama separada. El HEAD apunta a este commit fuera de master. Por tanto, ahora abría que hacer lo siguiente:

```sh
git checkout master
git merge a060db5 // Que es donde apunta ahora HEAD ( ya no aparece HEAD -> master, o HEAD->nombre_rama). HEAD apunta al commit a060db5.
```

### git revert

Con este comando podemos deshacer cambios de una forma más segura ya que no se pierden cambios al generar un nuevo commit sin eliminar los commit del historial.

*REVERT* se basa en que añade las líneas que se quitaron y quita las que se añadieron, por tanto devuelve al estado anterior pero sin eliminar el commit anterior (o anteriores).

**Muy importante**: para *revert* se indica el *commit* que se va a revertir, NO al que queremos ir. Es decir, para revertir el último *commit* se indica `git revert HEAD` o con su hash, pero no *HEAD~1* que es al estado que volveríamos pero en un nuevo *commit*.

Para revertir el último commit haríamos lo siguiente:

```sh
git revert HEAD
```

Ahora nos aparece la ventana para hacer un *commit* y lo deja todo listo.

Evidentemente si hacemos un `git revert HEAD` dos veces estaremos en el misma situación pero con dos *commit* nuevos. Podríamos hacer un `git reset --hard HEAD~2` y los limpiaríamos (si no se han eviado al repositorio remoto que tendríamos que tener más cuidado).

Para revertir más de un *commit* se haría de la siguiente forma. En este ejemplo vamos a revertir de una vez los 2 últimos *commit* pero queremos que haga un solo *commit* al revertir.

```sh
git revert --no-commit HEAD
git revert --no-commit HEAD~1
git status
```

Tras estos comandos nos puede aparecer algo similar a esto:

```sh
On branch master
Your branch is based on 'origin/master', but the upstream is gone.
  (use "git branch --unset-upstream" to fixup)

You are currently reverting commit 305af64.
  (all conflicts fixed: run "git revert --continue")
  (use "git revert --abort" to cancel the revert operation)

Changes to be committed:
  (use "git reset HEAD <file>..." to unstage)

        modified:   index.html
        deleted:    styles.css
```

Si queremos abortar harímos `git revert --abort`, y en caso de querer confirmar los cambios ejecutaríamos  `git revert --continue` y aparece la ventana para hacer el *commit*.

## Rehaciendo la historia

### git rebase

Antes de nada, no es recomendable hacer *rebase* de *commit* de los que ya hayamos hecho *push* (ya estén en el servidor). Sobre todo, si estás trabajando con otras personas.

Si haces `git pull repositorio --rebase` la historia se *sobreescribe* en el local pero sobre el historial que ya está en el repositorio (no le afecta a otros programadores).

Ahora bien, si hago *push* de los últimos *commit* y **luego**, cuando otros programadores han bajado esos cambios, hago un *rebase* de esos *commit* y los reescribo... Se puede liar parda!

Si tengo varios *commit* y quiero fusionarlos en uno para limpiar el historial con `git rebase -i`  (rebase interactivo), siempre sobre trabajo que no se ha subido al repositorio remoto. Eso es lo que aconsejan. Si trabajas solo, todo esto importa poco.

```sh
git rebase -i HEAD~4 // se coloca justo antes de los últimos 4 que quiero fusionar/aplastar/reordenar...
```
