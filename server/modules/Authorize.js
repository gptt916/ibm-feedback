var env = process.env.NODE_ENV || 'development',
    config = require('../config/config.' + env);

var tools = require('./tools');

module.exports = {		
		//jwt verification for  APIs
		verifyToken: (req, res, next) => {
		
		var startDate = req.session.startDate;
		var endDate = req.session.lastRequestDate;
		var resource = "modeules/Authorize";
		var apiurl = "";
		
		if (req.header('Authorization')) {
			
					var axios = require('axios');
					var jwt_decode = require('jwt-decode');

					const token = req.header('Authorization').replace('Bearer', '').trim();	
					var decodedToken = jwt_decode(token);
					/*
					USING API CALL 
					var config = {
						method: 'get',
						url: 'https://iam.cloud.ibm.com/v1/apikeys?account_id='+decodedToken.account.bss+'&iam_id='+decodedToken.iam_id,
						headers: { 
							'Authorization': 'Bearer '+token
						}
					};

					axios(config)
					.then(function (response) {
						next()
					})
					.catch(function (error) {
						//console.log(error);
						var message = 'Authentication failed';
					return res.status(401).json(tools.errorResponseObj(error,message,startDate,endDate,resource,req.url));	
					});
					*/
					//Checking Expiry Time only
					var current_time = Date.now() / 1000;
					if ( decodedToken.exp < current_time) {
					 /* expired */ 
					 return res.status(401).json(tools.errorResponseObj(error,message,startDate,endDate,resource,req.url));
					}
					 else {
						 req.body.access_token = token
						 req.body.accountid = decodedToken.account.bss
						 req.body.user_name = decodedToken.name
						 next()
					 }
				
		} else {          
				// catch error if the operation wasn't successful
				var message = 'Validation error from form inputs';
				var error = {
					"msg": "Authorization header must be specified.",
					"param": "Bearer Token",
					"location": "header"
				};
				return res.status(401).json(tools.errorResponseObj(error,message,startDate,endDate,resource,req.url));

			}
	},
	
};

