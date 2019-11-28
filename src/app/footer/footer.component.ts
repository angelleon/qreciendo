import { Component, OnInit } from '@angular/core';

@Component({
  selector: 'app-footer',
  templateUrl: './footer.component.html',
  styleUrls: ['./footer.component.css']
})
export class FooterComponent implements OnInit {
  telefono = "442-238-7770"
  facebook = "https://www.facebook.com/QroMunicipio"
  correo = "municipio@Queraro.com"
  constructor() { }

  ngOnInit() {
  }

}
