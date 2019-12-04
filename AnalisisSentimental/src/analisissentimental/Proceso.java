package analisissentimental;

import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.util.HashMap;

public class Proceso {
    
    BufferedReader br = null;
    HashMap<String,Integer> valPalabra = new HashMap<String,Integer>();
    HashMap<String,Integer> valPalabraDefinida = new HashMap<String,Integer>();
    double porcentNeutro = 0.3;
    
    public void Proceso(){
        
    }
    
    public void Inicio() throws FileNotFoundException, IOException {
        AnalizarArchivos();
        PalabrasConValorDefinido();
        //MostrarHashMapDefinido();
        Evaluar();
        //MostrarHashMap();
    }
    
    public void AnalizarArchivos() throws FileNotFoundException, IOException{
        String direccion = "C:\\Users\\rodri\\Documents\\ITQ\\Semestre 8\\Ciencia de Datos\\AnalisisSentimental\\amazon_cells_labelled.txt";
        LeerArchivo(direccion);
        ObtenerContenido();
        direccion = "C:\\Users\\rodri\\Documents\\ITQ\\Semestre 8\\Ciencia de Datos\\AnalisisSentimental\\imdb_labelled.txt";
        LeerArchivo(direccion);
        ObtenerContenido();
        direccion = "C:\\Users\\rodri\\Documents\\ITQ\\Semestre 8\\Ciencia de Datos\\AnalisisSentimental\\yelp_labelled.txt";
        LeerArchivo(direccion);
        ObtenerContenido();
    }
    
    public void LeerArchivo(String direccion) throws FileNotFoundException{
        br = new BufferedReader(new FileReader(direccion));
    }
    
    public void ObtenerContenido() throws IOException{
        int cont = 0, valSentimiento = 0;
        String line = br.readLine();
        while (null!=line){
            try{
                valSentimiento = Integer.parseInt(line.substring(line.length()-1,line.length()));
                if(valSentimiento == 0) valSentimiento=-1;
                ObtenerPalabras(line.substring(0, line.length()-1), valSentimiento, cont);
                cont++;
                line = br.readLine();
            }catch(NullPointerException n){
            }
        }
        br.close();
    }

    public void ObtenerPalabras(String comentario, int valor, int cont){
        String [] ArrayP = comentario.split(" ");
        for(int i=0; i<ArrayP.length; i++){
            String Evaluar = ArrayP[i];
            Evaluar = RestringirPalabra(Evaluar);
            if(Evaluar == ""){}
            else if(cont == 0){
                valPalabra.put(Evaluar, valor);
            }
            else if(valPalabra.containsKey(Evaluar)){
                valPalabra.put(Evaluar, valPalabra.get(Evaluar)+ valor);
            }
            else if(!valPalabra.containsKey(Evaluar)){
                valPalabra.put(Evaluar, valor);
            }
        }
    }

    public String RestringirPalabra(String palabra){
        String r = palabra.toLowerCase();
        r = r.replace(".", " ");
        r = r.replace("-", "");
        r = r.replace("1", "");
        r = r.replace("2", "");
        r = r.replace("3", "");
        r = r.replace("4", "");
        r = r.replace("5", "");
        r = r.replace("6", "");
        r = r.replace("7", "");
        r = r.replace("8", "");
        r = r.replace("9", "");
        r = r.replace("0", "");
        r = r.replace("?", "");
        r = r.replace("!", "");
        r = r.replace("?", "");
        r = r.replace(",", "");
        r = r.replace("(", "");
        r = r.replace(")", "");
        r = r.replace("/", "");
        r = r.replace("*", "");
        r = r.replace(";", "");
        r = r.replace("&", "");
        r = r.replace("#", "");
        r = r.replace("$", "");
        r = r.replace("%", "");
        r = r.replace("+", "");
        r = r.replace("-", "");
        return r;
    }
    
    public void PalabrasConValorDefinido() throws FileNotFoundException, IOException{
        AnalizarPalabrasDefinidas();
    }
    
    public void AnalizarPalabrasDefinidas() throws FileNotFoundException, IOException{
        String direccion = "C:\\Users\\rodri\\Documents\\ITQ\\Semestre 8\\Ciencia de Datos\\AnalisisSentimental\\positive-words.txt";
        LeerArchivo(direccion);
        ValoresDefinidos(1);
        direccion = "C:\\Users\\rodri\\Documents\\ITQ\\Semestre 8\\Ciencia de Datos\\AnalisisSentimental\\negative-words.txt";
        LeerArchivo(direccion);
        ValoresDefinidos(-1);
    }
    
    public void ValoresDefinidos(int valor) throws IOException{
        String palabra = "";
        M("lol");
        String line = br.readLine();
        while (null!=line){
            valPalabraDefinida.put(line, valor);
            line = br.readLine();
        }
    }
    
    public void Evaluar() throws FileNotFoundException, IOException{
        String ArchivoEvaluar = "C:\\Users\\rodri\\Documents\\ITQ\\Semestre 8\\Ciencia de Datos\\AnalisisSentimental\\amazon_cells_labelled.txt";
        LeerArchivo(ArchivoEvaluar);
        EvaluarArchivo();
    }
    
    public void EvaluarArchivo() throws IOException{
        int cont = 0, valSentimiento = 0, porcentaje = 0, valComentario = 0;
        String line = br.readLine();
        while (null!=line){
            try{
                valSentimiento = Integer.parseInt(line.substring(line.length()-1,line.length()));
                valComentario = EvaluarComentario(line);
                if(valSentimiento ==  1 && valComentario>=0){
                    M("COMENTARIO POSITIVO");
                    porcentaje++;
                }
                else if(valSentimiento ==  0 && valComentario<=0){
                    M("COMENTARIO NEGATIVO");
                    porcentaje++;
                }
                else{
                    if(ComentarioNeutro(line,valSentimiento,valComentario)){
                        porcentaje++;
                        M("NEUTRO");
                    }
                    else{
                        M("SIN CLASIFICAR");
                    }
                }
                M("\n\n");
                cont++;
                line = br.readLine();
            }catch(NullPointerException n){
                //error de lectura en un punto nulo
            }
        }
        M("Total de aciertos: " + porcentaje);
        M(100*porcentaje/cont + "%");
    }
    
    public boolean ComentarioNeutro(String line, int valSentimeinto, int valComentario){
        boolean neutro = true;
        double numPalabrasRequeridas = 0;
        String [] palabras = line.split(" ");
        numPalabrasRequeridas = palabras.length*porcentNeutro;
        if(Math.abs(valComentario-valSentimeinto)<= numPalabrasRequeridas){
            return true;
        }
        else{
            return false;
        }
    }
    
    public int EvaluarComentario(String comentario){
        String []comen = comentario.split(" ");
        int valorComentario = 0;
        String palabra = "";
        for(int i=0; i<comen.length; i++){
            palabra = RestringirPalabra(comen[i]);
            if(i==0) M(comentario);
            if(valPalabraDefinida.containsKey(palabra)){
                //M("palabra definida encontrada: " + palabra + " valor: " + valPalabraDefinida.get(palabra));
                if(valPalabraDefinida.get(palabra)==1){
                    valorComentario += 1;
                }else{
                    valorComentario += -1;
                }
            }
            else if(valPalabra.containsKey(palabra)){
                //M("palabra encontrada: " + palabra + " valor: " + valPalabra.get(palabra));
                if(valPalabra.get(palabra)>0){
                    valorComentario += 1;
                }else{
                    valorComentario += -1;
                }
            }
            else{
                //no s eencontro la palabra
            }
        }
        M(valorComentario+ "");
        return valorComentario;
    }
    
    public void M(String mensaje){
        System.out.println(mensaje);
    }
    
    public void MostrarHashMap(){
        valPalabra.forEach((k,v) -> System.out.println(k + ": \t\t"  + v + " puntuacion"));
    }
    
    public void MostrarHashMapDefinido(){
        valPalabraDefinida.forEach((k,v) -> System.out.println(k + ": \t\t"  + v + " puntuacion"));
    }
}
