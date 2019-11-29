import { Component, OnInit } from '@angular/core';


@Component({
  selector: 'app-proyecto',
  templateUrl: './proyecto.component.html',
  styleUrls: ['./proyecto.component.css']
})
export class ProyectoComponent implements OnInit {
  title_proyect = "Repavimentación en Carrillo ";
  constructor() { }

  ngOnInit() {
  }

}
