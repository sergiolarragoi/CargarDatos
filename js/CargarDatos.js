var miAplicacion = angular.module('miAplicacion', []);
miAplicacion.controller('mainController', ["$scope", "$http", function ($scope, $http) {
        $scope.lista = [];
        $scope.misdatos = {
            id: "",
            nombre: "",
            apellido1: "",
            apellido2: "",
            ciclo: "",
            curso: ""
        };
        $http.get('controlador/controlador_consulta_ikasleak.php').then(function (response) {
            // Calcular nuevo id
            $scope.lista = response.data;
            $scope.ultimoId = $scope.lista[parseInt($scope.lista.length) - 1].id;
            $scope.misdatos.id = parseInt($scope.ultimoId) + 1;
        });
        $scope.verAgregaralumno = 'false';
        $scope.VerMenu = 'true';

        $scope.Iniciaragregar = function () {
            $scope.verAgregaralumno = 'true';
            $scope.VerMenu = 'false';
        };
        $scope.agregar = function () {
           
     
            var listaguardar = $scope.misdatos;
            listaguardar = JSON.stringify(listaguardar);
            alert(listaguardar);
            $http({url: 'controlador/controlador_insertar_ikasleak.php',
                method: "GET",

                params: {value: listaguardar}


            }).success(function (response) {
               $scope.misdatos.id = response;
              $scope.lista.push({id: $scope.misdatos.id,
                nombre: $scope.misdatos.nombre,
                apellido1: $scope.misdatos.apellido1,
                apellido2: $scope.misdatos.apellido2,
                ciclo: $scope.misdatos.ciclo,
                curso: $scope.misdatos.curso
            }); 
            });
//            $scope.misdatos.id++;
//            $scope.misdatos.nombre = '';
//            $scope.misdatos.apellido1 = '';
//            $scope.misdatos.apellido2 = '';
//            $scope.misdatos.ciclo = '';
//            $scope.misdatos.curso = '';
            $scope.verAgregaralumno = 'false';
            $scope.VerMenu = 'true';
        };
        $scope.cancelar = function () {
            alert($scope.misdatos.id);
            $scope.misdatos.id = $scope.misdatos.id;
            $scope.misdatos.nombre = '';
            $scope.misdatos.apellido1 = '';
            $scope.misdatos.apellido2 = '';
            $scope.misdatos.ciclo = '';
            $scope.misdatos.curso = '';
            $scope.verAgregaralumno = 'false';
            $scope.VerMenu = 'true';
        };
        $scope.Eliminarlista = function () {
            $scope.lista = [];
        };

        $scope.eliminar = function (row, id) {
            if (confirm("¿Seguro que desea eliminar?")) {
                $scope.lista.splice(row, 1);
                $scope.persona_borrar = parseInt(id);
                alert($scope.persona_borrar);
                $http({url: 'controlador/controlador_borrar_ikasleak.php',
                    method: "GET",
                    params: {value: $scope.persona_borrar}

                }).then(function (response) {
                    alert(response);
                });
            }
        };

        $scope.modificar = function (index, item) {
            $scope.verAgregaralumno = "false";
            $scope.verModificaralumno = "true";
            $scope.VerMenu = "false";
            $scope.misdatos.id = item.id;
            $scope.misdatos.nombre = item.nombre;
            $scope.misdatos.apellido1 = item.apellido1;
            $scope.misdatos.apellido2 = item.apellido2;
            $scope.misdatos.ciclo = item.ciclo;
            $scope.misdatos.curso = item.curso;

        };
        $scope.guardar_modificar = function () {
            alert("hola");
            //modificar scope
            for (i = 0; i < $scope.lista.length; i++) {
                if ($scope.lista[i].id === $scope.misdatos.id) {
                    $scope.lista[i].nombre = $scope.misdatos.nombre;
                    $scope.lista[i].apellido1 = $scope.misdatos.apellido1;
                    $scope.lista[i].apellido2 = $scope.misdatos.apellido2;
                    $scope.lista[i].ciclo = $scope.misdatos.ciclo;
                    $scope.lista[i].curso = $scope.misdatos.curso;

                }
            }
            //modificar BBDD
            var listaaguardar=$scope.misdatos;
            var listaaguardar=JSON.stringify(listaaguardar);
            alert(listaaguardar);
            $http({url: 'controlador/controlador_modificar_ikasleak.php',
                    method: "GET",
                    params: {value: listaaguardar}

                }).then(function (response) {
                    alert(response);
                });
        };

        $scope.cambiar = function () {
            for (i = 0; i < $scope.lista.length; i++) {
                if ($scope.lista[i].id === $scope.misdatos.id) {
                    $scope.lista[i].nombre = $scope.misdatos.nombre;
                    $scope.lista[i].edad = $scope.misdatos.edad;
                }
            }
        };
        /*
         * Código de busqueda, se busca por cualquiera de las características. Primero se da al botón iniciar busqueda 
         * para ver los campos de busqueda y luego se filtra.
         */
        $scope.VerFormBusqueda = false;
        $scope.Buscar = function () {
            $scope.VerFormBusqueda = true;
        };
        $scope.finbuscar = function () {
            $scope.TEXTObusqueda = "";
            $scope.VerFormBusqueda = false;
        };

    }]);