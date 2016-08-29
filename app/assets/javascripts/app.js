$(document).ready(function(){

  var toc = $(".wrapper .option-menu");

  $('footer').on('inview', function(event, isInView) {
    isInView ? toc.fadeOut() : toc.fadeIn();
  });
  
  //Share Button
  var button = document.getElementById('share-button'),
  wrapper = document.getElementById('share-wrapper'),
  overlay = document.getElementById('share-overlay');   
  console.log("Ay se va!!"); 
  //open and close menu when the button is clicked
    
  var open = false;
  button.addEventListener('click', handler, false);
  wrapper.addEventListener('click', sharehandle, false);

  function sharehandle(e){
      e.stopPropagation();
  }

  function handler(e){
      if (!e) var e = window.event;
      e.stopPropagation();//so that it doesn't trigger click event on document
      if(!open){
        openNav();
      }
      else{
        closeNav();
      }
  }
  function openNav(){
    open = true;
    button.innerHTML = "-";
    classie.add(overlay, 'on-overlay');
    classie.add(wrapper, 'opened-nav');
  }
  function closeNav(){
    open = false;
    button.innerHTML = "+";
    classie.remove(overlay, 'on-overlay');
    classie.remove(wrapper, 'opened-nav');
  }
  document.addEventListener('click', closeNav);
});