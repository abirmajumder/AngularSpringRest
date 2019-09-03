<html >
	<head >
		<title >Subject Areas</title>
		<link rel = 'stylesheet' href = 'css/bootstrap.min.css' type = 'text/css' />
		<link rel = 'stylesheet' href = 'css/table-abir.css' type = 'text/css' />
		<script src = 'js/jquery-1.9.1.js' type = 'text/javascript' ></script>
		<script src = 'js/bootstrap.min.js' type = 'text/javascript' ></script>
		<script src = 'js/angular.min.js' type = 'text/javascript' ></script>
		<script src = 'js/angucomplete-alt.js' type = 'text/javascript' ></script>
		<script src = 'js/common.js' type = 'text/javascript' ></script>
		<script >
			var initLoadArr = [ { "entity" : "areas", "url" : "" } ];
			var emptyObj = { "area" : {"id":"","name":"","description":"","active":"Y"} };
			editableGridController( angular.module( 'app',[]), 'cntl', emptyObj, initLoadArr );
		</script>
	</head>
	<body ng-controller = 'cntl' ng-app = 'app' ng-init="initing()">
		<form name = 'cnfBusinessLine_form' >
			<div class='container-fluid'>
				<div class='col-sm-12'>
					<h3>{{msg}}</h3>
				</div>
				<div class='col-sm-12'>
					<h3>Subject Area</h3>
				</div>
				<div class='col-sm-12'>
					<table class='table'>
						<thead>
							<tr>
								<th>Subject Area</th>
								<th>Description</th>
								<th>Depending On</th>
								<th/>
							</tr>
						</thead>
						<tbody>
							<tr ng-repeat="sub in areas">
								<td>
									<input ng-model="sub.name" ng-readonly="!rowView('areas', sub.id)" ng-class="rowClass('areas', sub.id)" />
								</td>
								<td>
									<input ng-model="sub.description" ng-readonly="!rowView('areas', sub.id)" ng-class="rowClass('areas', sub.id)"  />
								</td>
								<td>
									<select class='form-control' ng-model='sub.dependentSubjectArea' 	>
											<option ng-repeat='x in areas' ng-hide='x.id == sub.id' ng-value="{{x.id}}">{{x.name}}</option>
									</select>
								</td>
								<td>
									<span class="glyphicon glyphicon-edit" ng-show="!rowView('areas', sub.id)" 
										style='color:green;cursor:hand;' ng-click="setViewForEdit( 'areas', sub.id, true)"></span>
									<span class="glyphicon glyphicon-ok-circle" ng-show="rowView('areas', sub.id)" 
										style='color:green;cursor:hand;' ng-click="updateRow( 'areas', sub )"></span>
									<span class="glyphicon glyphicon-remove-circle" ng-show="rowView('areas', sub.id)"
										style='color:red;cursor:hand;' ng-click="setViewForEdit( 'areas', sub.id, false)"></span>
								</td>
							</tr>
							<tr>
								<td>
									<input ng-model="oarea.name" class='form-control' />
								</td>
								<td>
									<input ng-model="oarea.description" class='form-control'  />
								</td>
								<td>
									<select class='form-control' ng-model='oarea.dependentSubjectArea'>
										<option ng-repeat='x in areas' ng-hide='x.id == sub.id'  value="{{x.id}}">{{x.name}}</option>	
									</select>
								</td>
								<td>
									<input type="image" src="image/user-add-icon.png" style="color:red;" ng-click="addAny('areas','oarea')"/>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
		</form>	
	</body>
</html>				
