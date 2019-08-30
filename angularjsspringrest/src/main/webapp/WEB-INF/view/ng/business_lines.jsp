<html >
	<head >
		<title >Business Lines</title>
		<link rel = 'stylesheet' href = 'css/bootstrap.min.css' type = 'text/css' />
		<script src = 'js/jquery-1.9.1.js' type = 'text/javascript' ></script>
		<script src = 'js/bootstrap.min.js' type = 'text/javascript' ></script>
		<script src = 'js/angular.min.js' type = 'text/javascript' ></script>
		<script src = 'js/common.js' type = 'text/javascript' ></script>
		<script >
			
			var app = angular.module( 'app',[]);
			app.controller( 'cntl', function($scope,$http) {
				$scope.st = ["Y","N"];
				
				$scope.initing = function() {
					$scope.msg = 'Loading...';
					$http.get("lines/search/findByActive?active=Y")
						 .then( function(res) {
							 ///alert(JSON.stringify(res));
							 $scope.lines = res.data._embedded.lines;
							 $scope.msg = '';
						 });
				}
			});

		</script>
		<style type="text/css">
			input,textarea {
			  background-color:#f7f7f7;
			  border:none;
			  border-radius:0px;
			}
		</style>
	</head>
	<body ng-controller = 'cntl' ng-app = 'app' ng-init="initing()">
		<form name = 'cnfBusinessLine_form' >
			<div class='container-fluid'>
				<div class='col-sm-12'>
					<h3>{{msg}}</h3>
				</div>
				<div ng-repeat='bl in lines' class='col-sm-12'>
					<input ng-model="bl.businessLine" class='form-control' />
					<select ng-model='bl.active' class='form-control'>
						<option ng-repeat="x in st" value="{{x}}">{{x}}</option>
					</select>
				</div>
			</div>
		</form>
	</body>
</html>
