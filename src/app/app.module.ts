import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';

import { AppComponent } from './app.component';
import { ProyectoComponent } from './proyecto/proyecto.component';
import { HeaderComponent } from './header/header.component';
import { FooterComponent } from './footer/footer.component';
import { SuscripcionComponent } from './suscripcion/suscripcion.component';
import { ProgresoComponent } from './progreso/progreso.component';
import { NavComponent } from './nav/nav.component';
import { ComentariosComponent } from './comentarios/comentarios.component';
import { CarruselComponent } from './carrusel/carrusel.component';

@NgModule({
  declarations: [
    AppComponent,
    HeaderComponent,
    FooterComponent,
    SuscripcionComponent,
    NavComponent,
    ProgresoComponent,
    ProyectoComponent,
    ComentariosComponent,
    CarruselComponent
  ],
  imports: [
    BrowserModule
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }
