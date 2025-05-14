package beans;
import java.util.Date;

public class SesionRespuesta {
    private Integer idSesion;
    private Date fechaInicio;
    private Date fechaEnvio;
    private Byte estadoTerminado;
    private Integer idAsignacionFormulario; // Foreign Key
    private String idEncuestado;

    public SesionRespuesta() {
    }

    public SesionRespuesta(Integer idSesion, Date fechaInicio, Date fechaEnvio, Byte estadoTerminado, Integer idAsignacionFormulario, String idEncuestado) {
        this.idSesion = idSesion;
        this.fechaInicio = fechaInicio;
        this.fechaEnvio = fechaEnvio;
        this.estadoTerminado = estadoTerminado;
        this.idAsignacionFormulario = idAsignacionFormulario;
        this.idEncuestado = idEncuestado;
    }

    public Integer getIdSesion() {
        return idSesion;
    }

    public void setIdSesion(Integer idSesion) {
        this.idSesion = idSesion;
    }

    public Date getFechaInicio() {
        return fechaInicio;
    }

    public void setFechaInicio(Date fechaInicio) {
        this.fechaInicio = fechaInicio;
    }

    public Date getFechaEnvio() {
        return fechaEnvio;
    }

    public void setFechaEnvio(Date fechaEnvio) {
        this.fechaEnvio = fechaEnvio;
    }

    public Byte getEstadoTerminado() {
        return estadoTerminado;
    }

    public void setEstadoTerminado(Byte estadoTerminado) {
        this.estadoTerminado = estadoTerminado;
    }

    public Integer getIdAsignacionFormulario() {
        return idAsignacionFormulario;
    }

    public void setIdAsignacionFormulario(Integer idAsignacionFormulario) {
        this.idAsignacionFormulario = idAsignacionFormulario;
    }

    public String getIdEncuestado() {
        return idEncuestado;
    }

    public void setIdEncuestado(String idEncuestado) {
        this.idEncuestado = idEncuestado;
    }
}