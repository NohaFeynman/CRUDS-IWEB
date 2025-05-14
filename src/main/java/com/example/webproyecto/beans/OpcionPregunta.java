package beans;

public class OpcionPregunta {
    private Integer idOpcion;
    private String textoOpcion;
    private Integer idPregunta; // Foreign Key

    public OpcionPregunta() {
    }

    public OpcionPregunta(Integer idOpcion, String textoOpcion, Integer idPregunta) {
        this.idOpcion = idOpcion;
        this.textoOpcion = textoOpcion;
        this.idPregunta = idPregunta;
    }

    public Integer getIdOpcion() {
        return idOpcion;
    }

    public void setIdOpcion(Integer idOpcion) {
        this.idOpcion = idOpcion;
    }

    public String getTextoOpcion() {
        return textoOpcion;
    }

    public void setTextoOpcion(String textoOpcion) {
        this.textoOpcion = textoOpcion;
    }

    public Integer getIdPregunta() {
        return idPregunta;
    }

    public void setIdPregunta(Integer idPregunta) {
        this.idPregunta = idPregunta;
    }
}
