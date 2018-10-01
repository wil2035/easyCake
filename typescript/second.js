var name = "Javier Ruiz";
var age = 28;
var sentence = "Hola, mi nombre es " + name + ".\nEste a\u00F1o voy a cumplir " + (age + 1) + " a\u00F1os.";
// Esto sería equivalente a
var sentence = "Hola, mi nombre es " + name + ".\n\n" + "Este año voy a cumplir " + (age + 1) + " años.";
var arrayNumber = [1, 2, 3];
var arrayString = ['1', '2', '3'];
// Ó bien de la siguiente manera
var arrayNumber = [1, 2, 3];
var arrayString = ['1', '2', '3'];
var arrayMixed = [2, '5', 3];
// Declaramos el tuple
var array;
// Inicializamos Correctamente
array = ['Hola', 2];
// Inicializamos Incorrectamente
array = [2, 'hola']; // Regresará un error
/*// Roles
enum Roles { Admin, User}; // Admin = 0, User = 1
let user: Roles = Roles.Admin;

// Roles
enum Roles { Admin = 1, User};
let user: Roles = Roles.Admin; // Ahora User será 2
// Modificando todos
enum Roles { Admin = 1, User = 3, Guest = 0 };
*/
// Any
var list = [1, '2', true];
var user = {
    name: "Tu nombre",
    age: 29,
    havePets: true
};
console.log(list[0], user.name);
;
var puppy = {
    name: "Mascota"
};
