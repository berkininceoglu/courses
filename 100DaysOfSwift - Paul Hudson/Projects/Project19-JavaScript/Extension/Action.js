var Action = function() {};

Action.prototype = {

run: function(parameters) {
    parameters.completeFunction({"URL": document.URL ,"title": document.title });
},

finalize: function(parameters) {
    var customJavaScript = parameters.customJavaScript;
    eval(customJavaScript);
}

};

var ExtensionPreprocessingJS = new Action
