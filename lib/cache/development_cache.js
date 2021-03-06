// Generated by CoffeeScript 1.8.0
var DevelopmentCache, fs, path;

path = require('path');

fs = require('fs');

module.exports = DevelopmentCache = (function() {
  function DevelopmentCache() {}

  DevelopmentCache.prototype.route = function(conf) {
    var app, name, route, script, scripts, src, tags, _i, _len;
    app = conf.app;
    scripts = conf.scripts;
    src = conf.src;
    name = conf.name;
    for (_i = 0, _len = scripts.length; _i < _len; _i++) {
      script = scripts[_i];
      route = "/" + name + "/" + script;
      app.get(route, (function(_this) {
        return function(req, res) {
          var file, match;
          match = req.path.match(new RegExp("^\/" + name + "\/(.*)"));
          file = path.join(src, match[1]);
          res.header({
            'Content-Type': 'text/javascript'
          });
          return fs.readFile(file, function(err, data) {
            if (!err) {
              return res.send(data);
            }
            res.statusCode = 404;
            return res.send();
          });
        };
      })(this));
    }
    tags = (function() {
      var _j, _len1, _results;
      _results = [];
      for (_j = 0, _len1 = scripts.length; _j < _len1; _j++) {
        script = scripts[_j];
        _results.push("<script src='/" + name + "/" + script + "' type='text/javascript'></script>\n");
      }
      return _results;
    })();
    return tags.join('');
  };

  return DevelopmentCache;

})();
