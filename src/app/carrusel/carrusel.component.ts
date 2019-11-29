import { Component, OnInit } from '@angular/core';

@Component({
  selector: 'app-carrusel',
  templateUrl: './carrusel.component.html',
  styleUrls: ['./carrusel.component.css']
})
export class CarruselComponent implements OnInit {
  url_1 = "qreciendo/proyectos/proyecto_id";
  url_2 = "qreciendo/proyectos/proyecto_id";
  url_3 = "qreciendo/proyectos/proyecto_id";

  titulo_2 = "Rotura de pavimento";
  titulo_3 = "Relleno necesario";
  tiempo_2 = " 3 semanas";
  tiempo_3 = " 5 semanas"  ;
  
  
  url_foto_3 = "assets/reparacion001.jpg";
  url_foto_2 = "assets/reparacion005.jpg";



  constructor() { }

  ngOnInit() {
  }

}
