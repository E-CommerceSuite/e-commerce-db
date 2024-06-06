USE `e-commerce`;

-- Atributos --
INSERT INTO `e-commerce`.`attributes` (`name`) VALUES ('Peso');
INSERT INTO `e-commerce`.`attributes` (`name`) VALUES ('Talla');
INSERT INTO `e-commerce`.`attributes` (`name`) VALUES ('Color');
INSERT INTO `e-commerce`.`attributes` (`name`) VALUES ('Dimensiones');

-- Tipos de permisos --

INSERT INTO `e-commerce`.`permission_types` (`permission_type`, `description`) VALUES ('CREATE', 'Permite a los usuarios agregar nuevos registros a la base de datos.');
INSERT INTO `e-commerce`.`permission_types` (`permission_type`, `description`) VALUES ('READ', 'Permite a los usuarios ver o consultar los registros existentes');
INSERT INTO `e-commerce`.`permission_types` (`permission_type`, `description`) VALUES ('UPDATE', 'Permite a los usuarios modificar los registros existentes.');
INSERT INTO `e-commerce`.`permission_types` (`permission_type`, `description`) VALUES ('DELETE', 'Permite a los usuarios borrar registros de la base de datos.');

-- Roles --
SELECT * FROM `e-commerce`.roles;
INSERT INTO `e-commerce`.`roles` (`name`, `description`) VALUES ('Administrador', 'Se encarga de gestionar el inventario de productos');
INSERT INTO `e-commerce`.`roles` (`name`, `description`) VALUES ('Gerente de Inventario', 'Se encarga de gestionar el inventario de productos');
INSERT INTO `e-commerce`.`roles` (`name`, `description`) VALUES ('Gerente de Ventas', 'Gestiona las ventas y los pedidos, procesando y monitoreando el estado de los mismos');
INSERT INTO `e-commerce`.`roles` (`name`, `description`) VALUES ('Gerente de Marketing', 'Responsable de crear y gestionar campañas de marketing');
INSERT INTO `e-commerce`.`roles` (`name`, `description`) VALUES ('Gerente de Atención al Cliente', 'Atiende consultas y quejas de los clientes, proporciona soporte técnico y de producto');
INSERT INTO `e-commerce`.`roles` (`name`, `description`) VALUES ('Vendedor', 'Gestiona sus propios productos, incluyendo la creación, actualización y eliminación de productos');
INSERT INTO `e-commerce`.`roles` (`name`, `description`) VALUES ('Usuario Registrado', 'Navega y compra productos, puede ver su historial de pedidos ...');
INSERT INTO `e-commerce`.`roles` (`name`, `description`) VALUES ('Visitante Anónimo', 'Puede navegar por los productos y añadirlos al carrito, pero debe registrarse...');

-- Estados de ordenes --
SELECT * FROM `e-commerce`.order_statuses;
INSERT INTO `e-commerce`.`order_statuses` (`name`, `description`) VALUES ('Pendiente', 'La orden ha sido creada, pero el pago aún no ha sido confirmado. Este es el estado inicial justo después de que el cliente realiza el pedido.');
INSERT INTO `e-commerce`.`order_statuses` (`name`, `description`) VALUES ('Pago Aprobado', 'El pago ha sido confirmado y aprobado. La orden está lista para ser procesada.');
INSERT INTO `e-commerce`.`order_statuses` (`name`, `description`) VALUES ('Procesando', 'La orden está en proceso de preparación y empaquetado para el envío. Esto incluye la verificación de inventario y la preparación del paquete.');
INSERT INTO `e-commerce`.`order_statuses` (`name`, `description`) VALUES ('Enviado', 'La orden ha sido enviada al cliente. En este estado, el paquete está en tránsito.');
INSERT INTO `e-commerce`.`order_statuses` (`name`, `description`) VALUES ('Entregado', 'El cliente ha recibido la orden. El proceso de entrega ha sido completado exitosamente.');
INSERT INTO `e-commerce`.`order_statuses` (`name`, `description`) VALUES ('Cancelado', 'La orden ha sido cancelada. Esto puede ocurrir si el cliente decide cancelar la orden o si hay un problema con el pago o inventario.');
INSERT INTO `e-commerce`.`order_statuses` (`name`, `description`) VALUES ('Devuelto', 'El cliente ha devuelto la orden después de la entrega. Esto puede ser debido a insatisfacción con el producto');
INSERT INTO `e-commerce`.`order_statuses` (`name`, `description`) VALUES ('Reembolso en Proceso', 'El reembolso para la orden devuelta está en proceso. Esto puede incluir la verificación del estado del producto devuelto.');
INSERT INTO `e-commerce`.`order_statuses` (`name`, `description`) VALUES ('Reembolsado', 'El reembolso ha sido completado y el dinero ha sido devuelto al cliente.');
INSERT INTO `e-commerce`.`order_statuses` (`name`, `description`) VALUES ('Fallido', 'La orden no pudo ser procesada debido a un error');

-- estados de carrito --
SELECT * FROM `e-commerce`.cart_statuses;
INSERT INTO `e-commerce`.`cart_statuses` (`name`, `description`) VALUES ('Activo', 'El carrito está en uso y el cliente está agregando o quitando productos. Este es el estado inicial.');
INSERT INTO `e-commerce`.`cart_statuses` (`name`, `description`) VALUES ('Abandonado', 'El carrito ha estado inactivo durante un período de tiempo prolongado sin que se complete la compra. ');
INSERT INTO `e-commerce`.`cart_statuses` (`name`, `description`) VALUES ('Guardado', 'El cliente ha guardado el carrito para finalizar la compra más tarde.');
INSERT INTO `e-commerce`.`cart_statuses` (`name`, `description`) VALUES ('Convertido en Pedido', 'El carrito se ha convertido en una orden de compra, el carrito se transforma en orden');
INSERT INTO `e-commerce`.`cart_statuses` (`name`, `description`) VALUES ('Expirado', 'El carrito ha caducado debido a políticas del sitio, como límites de tiempo para completar una compra.');

-- categorias --
SELECT * FROM `e-commerce`.categories;
INSERT INTO `e-commerce`.`categories` (`name`) VALUES ('Electrónica');
INSERT INTO `e-commerce`.`categories` (`name`) VALUES ('Moda');
INSERT INTO `e-commerce`.`categories` (`name`) VALUES ('Hogar y Jardín');
INSERT INTO `e-commerce`.`categories` (`name`) VALUES ('Salud y Belleza');








