let intro = document.querySelector('.intro');
let logo = document.querySelector('.logo-header');
let logoSpan = document.querySelectorAll('.logo');

window.addEventListener('DOMContentLoaded', ()=>{

    setTimeout(()=>{

        logoSpan.forEach((span, idx)=>{

            setTimeout(()=>{

                span.classList.add('active');

            },(idx + 1)*400)
        });

        setTimeout(()=>{
            logoSpan.forEach((span, idx)=>{

                setTimeout(()=>{
                    span.classList.remove('active');
                    span.classList.add('fade');
                },(idx + 1 )*50)
            })
        },2000);

        setTimeout(()=>{
            intro.style.top='-100vh';
        }, 2300)

    })
})

/*PARALLAX*/

document.addEventListener("mousemove" , parallax);
function parallax(e){
    this.querySelectorAll('.layer').forEach(layer =>{
        const speed = layer.getAttribute('data-speed')

        /**Cambiando los valores despues del / cambia la sensibilidad */

        const x=(window.innerWidth - e.pageX*speed)/200
        const y=(window.innerHeight - e.pageY*speed)/200

        
        layer.style.transform =  `translateX(${x}px) translateY(${y}px)`

    })
}
