# Política de seguridad

## Cómo avisar de un problema de seguridad

Si detectas una vulnerabilidad o un fallo que pueda poner en riesgo datos, accesos o servicios:

1. **No lo publiques.** No lo describas en un issue, en un pull request ni en ningún otro lugar visible para otras personas.
2. **Avísalo de forma privada** al **CTO / Responsable de Tecnología**, a través de los canales internos de la empresa.
3. Indica qué has visto, dónde y cómo reproducirlo, sin incluir contraseñas, claves ni datos de clientes.

## Qué no se debe subir nunca a un repositorio

- Contraseñas, claves de acceso, tokens o certificados.
- Archivos de configuración local con datos sensibles (por ejemplo, `.env`).
- Datos personales o datos de clientes.

Si por error se sube algo de esto, avisa de inmediato por el mismo canal privado. Una clave subida por error se considera comprometida y debe sustituirse, aunque se borre el archivo.
