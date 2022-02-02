// Generated by CoffeeScript 2.6.1
(function() {
  exports.ETLData = class ETLData {
    constructor(syslocation, readComplete) {
      this.syslocation = syslocation;
      this.readComplete = readComplete;
      this.fs = require('fs');
      this.parser = require('csv-parser');
      this.fileData = [];
      this.read();
    }

    read() {
      return this.fs.createReadStream(this.syslocation).pipe(this.parser()).on('data', (data) => {
        return this.fileData.push(data);
      }).on('err', (err) => {
        return console.log("Some error");
      }).on('end', () => {
        return this.readComplete(this.fileData);
      });
    }

    getData() {
      return this.fileData;
    }

  };

}).call(this);
