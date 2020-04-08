# CS 1XA3 Project02 - Singj36


## Overview

This is an interactive webpage/ CV for Japnit Singh which implements features using JS, jQuery, CSS and HTML5

## Usage
To visit the webpage you should click on the following link:

[Japnit Singh's CV ](https://mac1xa3.ca/u/singj36/)
## Implementation
The Webpage is a combination of HTML,JS and CSS code .

 I used HTML to increase the page interactiveness by providing hyper references, buttons, heading and references:


Implements references at the required elements which refer to a more detailed Block of the selected element:
```HTML
<a href="#volun">
     <h3>Volunteering</h3>
</a> 

```
```HTML
<div class="call"><a href="tel:2899-255-802">
<i class="fa fa-phone"></i><span>2899255802
</span></a></div>

```
which refers the click on Heading "Volunteering" to a section down below with the same element Id = "volun" and a detailed description of my volunteering positions.

Hyper reference provided to make a call from within the webpage

Used fa-fa font awesome icons to increase the scalability of the webpage:
```HTML
<i class="fa fa-phone"></i>

```


## Custom JavaScript Features
1.	The Webpage gives the user the option to switch between dark mode theme and light mode theme.
*The user can find the dark mode button on the top left corner of the webpage!

The feature was implemented using a combination of JS, CSS and HTML code:
```HTML
<button class="button" id="dark"
onclick="myFunction()" value="Dark Mode">
<i class="fas fa-sun"></i></button>
```
The JS code is responsible to toggle between the changing values of Light and Dark mode as the button value change
```JS

function change() {
    var elem = document.getElementById("dark");
    if (elem.value == "Dark Mode") elem.value = "Light Mode";
    else elem.value = "Dark Mode";
}
```
2. The WebPage uses JS and jQuery to implement Skills-Circles and Skills-Bar which fill the bar and the circle respectively as per the data-percent entered by the programmer.
```JS

 .find(".bar")
                .delay(i * 150)
                .animate({
                        width: $(this)
                            .parents()
                            .attr("data-percent") + "%"
                    },
                    1000,
                    "linear",
                    function () {
                        return $(this).css({
                            "transition-duration": ".5s"
```
3. The WebPage also implements a top button which toggles to the top the page when it is pressed. The button is implemented using a combination of JS and CSS code :
```JS
function scrollFunction() {
    if (document.body.scrollTop > 20 || 
document.documentElement.scrollTop > 20) {
mybutton.style.display = "block";
  } else {
        mybutton.style.display = "none";
    }
}


function topFunction() {
    document.body.scrollTop = 0;
    document.documentElement.scrollTop = 0;
}

```

        
  








4. The WebPage implements scroll transitions which was implemented using the following library:


   [AOS Scroll](https://michalsnik.github.io/aos/)





## References
[Naomi-CodePen](https://codepen.io/astronaomical/pen/KexYgb)
