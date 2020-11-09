//show cart functions
function increaseQuantity(item){
    var quantity = document.getElementById(item).value;
    quantity++;
    document.getElementById(item).value = quantity;
    updateCart();
}
function decreaseQuantity(item){
    var quantity = document.getElementById(item).value;
    quantity--;
    document.getElementById(item).value = quantity;
    updateCart();
}
function removeItem(item){
    document.getElementById(item).value = 0;
    updateCart();
}
function updateCart(){
    document.forms[0].submit();
}

function testimonial(headline, text, sig){
    this.headline = headline;
    this.text = text;
    this.sig = sig;
    this.write = function(){
        var str = '<aside class="testimonial">';
        str += '<h3>' + this.headline + '</h3>';
        str += '<p>' + this.text + '</p>';
        str += '<p class="quoted">-- ' + this.sig + '</p>';
        str += '</aside>';
        return str;
    };
}

var testimonials = new Array();
testimonials[0] = new testimonial('The Bookstore Is The Best!', 'The Bookstore really came through for me! I needed a quick and dirty book to learn Graphic Design. The Bookstore was the only place I could find what I needed. Kudos!', 'A Satisfied Customer');
testimonials[1] = new testimonial('I Love the Bookstore!', 'The Bookstore really came through for me! I needed a quick and dirty book to learn Web Design. The Bookstore was the only place I could find what I needed. Kudos!', 'Another Satisfied Customer');
testimonials[2] = new testimonial('Come Here First!!', 'The Bookstore really came through for me! I needed a quick and dirty book to learn Database Design. The Bookstore was the only place I could find what I needed. Kudos!', 'A Satisfied Database Admin');
testimonials[3] = new testimonial('Great Selection - And Prices!', 'The Bookstore really came through for me! I needed a quick and dirty book to learn Programming. The Bookstore was the only place I could find what I needed. Kudos!', 'A Satisfied Programmer');

function getRandomTestimonial(){
    document.write(testimonials[Math.floor(Math.random()*testimonials.length)].write());
}