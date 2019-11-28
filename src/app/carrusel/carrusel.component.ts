import { Component, OnInit } from '@angular/core';

@Component({
  selector: 'app-carrusel',
  templateUrl: './carrusel.component.html',
  styleUrls: ['./carrusel.component.css']
})
export class CarruselComponent implements OnInit {
  url_1 = ""
  url_2 = ""
  url_3 = ""

  titulo_1 = ""
  titulo_2 = ""
  titulo_3 = ""
  
  url_foto_1 = ""
  url_foto_2 = ""
  url_foto_3 = ""

  constructor() { }

  ngOnInit() {
  }

}
