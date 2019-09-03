function doPost( $http, $scope, url ) {
	alert( url );
	$http.post( url, $scope.md).then( 
		function(response) {
			alert( JSON.stringify( response ) );
			if( response.status == 200 ) {
				if( response.data.success ) {
					$scope.md = response.data.item;		
					$scope.errors = {};
				} else 
					$scope.errors = response.data.errors;
			}
		}, 
		function(err) { 
			alert(JSON.stringify(err)); 
		} 
	)
}

function search($scope, $http, entity,url) {
	$scope.msg = 'Loading...';
	$http.get(entity + "/" + url)
		 .then( function(res) {
			 $scope[entity] = res.data._embedded[entity];
			 $scope.msg = '';
			 //alert( JSON.stringify($scope[entity]) );
		 });
}

function loadById($arr, $http, entity, id) {
	$http.get( entity + "/" + id)
		 .then( function(res) {
			 for( var index in $arr ) {
				 if( $arr[index].id == id ) {
					 $arr[index]  = res.data;
					 break;
				 }
			 }
		 });
}

function postObject( $http, entity, obj, func) {
	$http.post(entity, obj)
	     .then(function (resp) {
	    	 func(resp);
	    	 //setTimeout(function(){ $scope.msg = ''; }, 3000);
	     });
}

function editableGridController( app, controllerName, objMap, initLoadArr) {
	
	app.controller( controllerName, function($scope,$http) {
		$scope.st = ["Y","N"];
		$scope.objEdits = {};
		$scope.objEmpty = objMap;//{ "doctor" : {"id":"","name":"","qualification":"","active":"Y"} };
		
		$scope.addAny = function( entity, objName) {
			postObject($http, entity, $scope[objName], function (resp) {
				$scope[objName].id = resp.data.id;
				$scope[entity].push($scope[objName]);
				alert(JSON.stringify($scope[objName]));
				$scope[objName] = $scope.objEmpty[objName];
			});
		}
		
		$scope.initing = function() {
			for (key in $scope.objEmpty) {
			    if ($scope.objEmpty.hasOwnProperty(key)) {
			    	$scope['o' + key] = $scope.objEmpty[key];
			    }
			} 
			initLoadArr.forEach(function(e,ind) {
				search($scope, $http, e.entity, e.url); 
			});
		}
		
		$scope.setViewForEdit = function( entity, docId, val ) {
			$scope.objEdits[ entity + "_" + docId] = val;
			if(!val) {
				loadById($scope[entity], $http, entity, docId);
			}
		}
		
		$scope.rowView = function ( entity, id ) {
			return $scope.objEdits[ entity + "_" + id];
		}
		
		$scope.rowClass = function( entity, id ) {
			return $scope.rowView(entity, id) ? 'form-control' : 'dead';
		}
		
		$scope.updateRow = function( entity, obj ) {
			postObject($http, entity, obj, function (resp) {
				alert(JSON.stringify(resp.data));
			});
			$scope.objEdits[ entity + "_" + obj.id] = false;
		}
	});
	return app;
}

