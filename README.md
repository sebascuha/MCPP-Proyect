# Disminución de la violencia como mecanismo para fomentar el crecimiento economico en los departamentos.

#### Analisis de la relación entre el desplazamiento forzado y la violencia con el ingreso per capita departamental entre los periodos de 2005 - 2019.

Sebastián Cuéllar Harker<br>
24-Mayo-2022<br>

![image](https://user-images.githubusercontent.com/105007314/170346404-4655487d-b3dd-4802-a106-ead1716426d7.png)

## Descripcion y Motivación

Colombia se ha caracterizado por hechos de violencia a lo largo de sus territorios ocacionando multiples cantidades de víctimas que en muchas ocaciones se vieron obligadas a realizar desplazamientos forzados de sus tierras y hogares. En Colombia se han realizado varios procesos de paz con la guerrilla y grupos paramilitares para finalizar varios años de conflicto armado, los más recioentes y masivos han sido la desmovilizacion de las autodefensad unidas de colombia (AUC) en el proceso de paz que finalizó con su desmovilizacion  entre 2004 y 2006, y los acuerdos de paz con la guerrilla de las FARC-EP en el año 2016; hechos que impactaron sustancialmente las dinámicas de la violencia en el país.<br>
<br>
Para este proyecto utilicé varias bases de datos provenientes de distintas fuentes, todas oficiales como la Unidad de victgimas del conflicto, el DANE, el centro de memoria histórico de Colombia y el banco mundial. Las bases que utilicé fueron las siguientes:
* PIB per capita departamental anual (DANE)
* Victimas de desplazamiento forzado anualizado (Unidad para la atencion y reparacion a las victimas)
* Casos ataques belicos (Centro de memoria histórica de Colombia - conflicto en cifras)
* Casos masacres (Centro de memoria histórica de Colombia - conflicto en cifras)
* Casos ataques belicos (Centro de memoria histórica de Colombia - conflicto en cifras)
* Deflactor del  PIB anual (Banco Mundial)<br>


El objetivo de este proyecto es entneder la relación de la violencia y los desplazamientos forzados con el ingreso per capita departamental. Esto debido a que la naturaleza del conflinco en los distintos territorios es diferente, muchas veces surge como protesta social hacia un proyecto de Estado distinto al vigente y en otros casos es promovido por intereses economicos para propositos relativamente legales e ilegales.
## Métodos Utilizados
1. Webstrapping para descargar bases de datos
* Utilizando Selenium para crea un bot que permita descargar las bases de datos.
* Utilizando el driver de Chrome.
2. Manejo, limpieza y union de distintas bases de datos
* Mediante `Pandas` subí las distintas bases de datos.
* Consolidé las 6 distintas bases de datos por medio de:
    * Agruparlas a nivel departamental debido a que como provenian de diferentes fuentes algunas estaban desagregadas a nivel municipal y indexadas al año.
    * Se necesitava que todas las bases estuvieran en formato 'larg'(long) para formar el panel de datos.
* Usando `merge` uní las diferentes bases de datos para consolidar un Panel de datos que contuviera toda la informacion relevente de confrontaciones bélicas, atentados por explosivos, masacres, desplazamientos forzados y ingreso per capita deflactado.
3. Visualizacion de datos utilizanzo `seaborn`,`matplotlib`,`PowerBI` y `R`
## Hallazgos
* La violencia ha tendido tendencias a disminutir en el periodo de 2005 a 2019
* El PIB per capita tiene corelacion negativa con los tipos de violencia (atentados terroristas, ataques belicos y mesacres) y con el desplazamiento forzado
* EL departamento con mayor violencia es Antioquia
* No todos los territorios apartados del centro economico tienen problemas de conflicto armado.

Aqui algunas visualizaciones de los resultados:

![hola](https://user-images.githubusercontent.com/105007314/170346471-758748e5-0d29-4350-be70-7f77c2b9e9b1.png)

![holanda](https://user-images.githubusercontent.com/105007314/170346495-a512ae18-fada-46a5-8514-1f8dd0825a5d.png)

![dispersion](https://user-images.githubusercontent.com/105007314/170346527-7eb205c8-74a9-4152-8867-7ea1a31c8f94.png)

![correlacion](https://user-images.githubusercontent.com/105007314/170346550-1dbd7eaa-4294-48b3-a8dc-8087c1e2a6ee.png)
