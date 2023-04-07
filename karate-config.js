function fn() {
	var config = {
		"name" : "Rk",
		"baseURL" : "https://reqres.in/api"
	}
	
	var env = karate.env
	karate.log('env:' , env);
	
	if(env == 'qa'){
		config.baseURL = "https://reqres.in/api/qa"
	}else if (env == 'dev'){
		config.baseURL = "https://reqres.in/api/dev"
	}else{
		config.baseURL = "https://reqres.in/api"
	}
	karate.log('baseURL:' , config.baseURL);
	karate.configure('connectTimeout',50000)
	karate.configure('readTimeout',50000)
	return config
}