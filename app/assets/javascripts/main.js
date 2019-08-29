document.addEventListener("turbolinks:load", function(){
  
  'use strict';
    
  
  var currentNum = 0;
  var prev = document.getElementById('prev');
  var next = document.getElementById('next');
  var target = document.getElementById('target');

  prev.addEventListener('click', function() {
    currentNum--;
    if (currentNum < 0) {
      currentNum = files.length - 1;
    }
    target.src = files[currentNum];
  });

  next.addEventListener('click', function() {
    currentNum++;
    if (currentNum > files.length - 1) {
      currentNum = 0;
    }
    target.src = files[currentNum];
  });

})

