package beans;

public class Pregunta {
    private Integer idPregunta;
    private String textoPregunta;
    private Byte tipoPregunta; // 0: multiple, 1: texto
    private Integer idFormulario; // Foreign Key
    private Integer orden;

    public Pregunta() {
    }

    public Pregunta(Integer idPregunta, String textoPregunta, Byte tipoPregunta, Integer idFormulario, Integer orden) {
        this.idPregunta = idPregunta;
        this.textoPregunta = textoPregunta;
        this.tipoPregunta = tipoPregunta;
        this.idFormulario = idFormulario;
        this.orden = orden;
    }

    public Integer getIdPregunta() {
        return idPregunta;
    }

    public void setIdPregunta(Integer idPregunta) {
        this.idPregunta = idPregunta;
    }

    public String getTextoPregunta() {
        return textoPregunta;
    }

    public void setTextoPregunta(String textoPregunta) {
        this.textoPregunta = textoPregunta;
    }

    public Byte getTipoPregunta() {
        return tipoPregunta;
    }

    public void setTipoPregunta(Byte tipoPregunta) {
        this.tipoPregunta = tipoPregunta;
    }

    public Integer getIdFormulario() {
        return idFormulario;
    }

    public void setIdFormulario(Integer idFormulario) {
        this.idFormulario = idFormulario;
    }

    public Integer getOrden() {
        return orden;
    }

    public void setOrden(Integer orden) {
        this.orden = orden;
    }
}