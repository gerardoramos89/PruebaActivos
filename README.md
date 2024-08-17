# Prueba-T-cnica.NET_-WTW
# Prueba Técnica - MiniSistema de Gestión de Inventario

## Descripción del Proyecto

Crear una aplicación web para la gestión de inventario. La aplicación debe permitir el registro de la entrada y salida de productos, así como el manejo del inventario actual.

## Requisitos

1. **Backend (C# con PostgreSQL):**
   - Crear una base de datos PostgreSQL para almacenar la información de productos y movimientos de inventario.
   - Desarrollar una API RESTful utilizando C# que permita registrar la entrada y salida de productos, así como consultar el inventario actual.
   - Utilizar Entity Framework (o Dapper) para interactuar con la base de datos.
   - Implementar stored procedures en PostgreSQL para realizar operaciones específicas, como registrar movimientos de inventario y calcular el inventario actual.

2. **Frontend (JavaScript):**
   - Implementar la interfaz de usuario utilizando JavaScript.
   - La interfaz debe permitir registrar la entrada y salida de productos, así como mostrar el inventario actual.
   - Utilizar cualquier framework de JavaScript (por ejemplo, React, Angular, Vue.js) o Vanilla JavaScript para desarrollar el frontend.

## Detalles Técnicos

- La API RESTful debe seguir las mejores prácticas de diseño de API.
- La autenticación debe ser segura, preferiblemente utilizando tokens JWT.
- Se deben manejar adecuadamente los errores y excepciones tanto en el backend como en el frontend.
- Se debe implementar un diseño responsivo para garantizar una buena experiencia de usuario en dispositivos móviles y de escritorio (Puedes usar una plantilla OpenSource si lo prefieres).
- Los stored procedures en PostgreSQL deben ser utilizados para realizar operaciones específicas en la base de datos (Entradas, Salidas y Estado Actual de Inventario.).

## Entregables

- Código fuente del backend, frontend y script SQL.
- Capturas De Pantalla De La Aplicación.

## Evaluación

Serán evaluados los siguientes aspectos:

- Funcionalidad completa según los requisitos especificados.
- Calidad y claridad del código.
- Manejo adecuado de errores y excepciones.
- Seguridad en la autenticación.
- Diseño de la base de datos, incluyendo la implementación y uso de stored procedures.
- Experiencia del usuario.

## Observaciones

- El tiempo máximo de entrega de esta prueba técnica es de dos dias.
- Se valorará cualquier esfuerzo adicional para mejorar la aplicación más allá de los requisitos mínimos.
- 

Lista de Actividades trabajadas en la prueba

1) Se crea Script de base de datos
2) Se crean procedimientos almacenados
3) Se crea proyecto .net Core, Usando Dapper y el Patron Repository para el manejo del Backend cumpliendo principios SOLID
4) Se crea Formulario de listar productos
   ![image](https://github.com/gerardoramos89/Prueba-T-cnica.NET_-WTW/assets/57040617/f944cd8b-aea1-41e9-adac-e3d38e38cfbd)

5) Requerimientos Avanzados - listar y crear factura

6) Listar Facturas
![image](https://github.com/gerardoramos89/Prueba-T-cnica.NET_-WTW/assets/57040617/0537d91c-7538-474b-bccc-53860a1bc16a)

7) Crear Facturas

![image](https://github.com/gerardoramos89/Prueba-T-cnica.NET_-WTW/assets/57040617/46fbbb20-5d43-4777-8845-0176070a9c8b)

8) Se Crea lista Clientes Facturas


![image](https://github.com/gerardoramos89/Prueba-T-cnica.NET_-WTW/assets/57040617/af1b935c-2236-4638-925a-c55916200c50)

9)Lista base de productos

![image](https://github.com/gerardoramos89/Prueba-T-cnica.NET_-WTW/assets/57040617/cfab351b-b368-4377-b1ff-65910312c30d)


