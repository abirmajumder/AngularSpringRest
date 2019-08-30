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

function loadInit($scope, $http, entity,url) {
	$scope.msg = 'Loading...';
	$http.get(entity + "/" + url)
		 .then( function(res) {
			 $scope[entity] = res.data._embedded[entity];
			 $scope.msg = '';
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

function postObject( $scope, $http, entity, obj) {
	$http.post(entity, obj)
	     .then(function (resp) {
	    	 //setTimeout(function(){ $scope.msg = ''; }, 3000);
	     });
}

