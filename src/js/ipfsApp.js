const ipfsAPI = require('ipfs-api');
//const fs = require('fs');

//Connceting to the ipfs network via infura gateway
const ipfs = ipfsAPI('ipfs.infura.io', '5001', {protocol: 'https'})

//Reading file from computer
//let testFile = fs.readFileSync("soda.png");
let testFile = $("#upload").val();
//Creating buffer for ipfs function to add file to the system
let testBuffer = new Buffer(testFile);
var fs = require('browserify-fs');


//Addfile router for adding file a local file to the IPFS network without any local node
bundles = {
   
    
    
    upload: async function (){
        
        ipfs.files.add(testBuffer, function (err, file) {
        if (err) {
          console.log(err);
        }
        console.log(file[0].hash)
        module.exports = {
        
        fs.writeFile('imageHash.json',JSON.stringify({'hash':file[0].hash}) , function () {
  		fs.readFile('imageHash.json', 'utf-8', function(err, data) {
           	 console.log(data);
         
        });
  	});
      })
   }

}

   

$(function () {
    $(window).load(function () {
        bundles.init();
    });
});
///home/gaethan/Images/sode.png
