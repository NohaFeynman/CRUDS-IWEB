package beans;

public class Distrito {
    private Integer idDistrito;
    private String nombreDistrito;
    private Integer idZonas; // Foreign Key

    public Distrito() {
    }

    public Distrito(Integer idDistrito, String nombreDistrito, Integer idZonas) {
        this.idDistrito = idDistrito;
        this.nombreDistrito = nombreDistrito;
        this.idZonas = idZonas;
    }

    public Integer getIdDistrito() {
        return idDistrito;
    }

    public void setIdDistrito(Integer idDistrito) {
        this.idDistrito = idDistrito;
    }

    public String getNombreDistrito() {
        return nombreDistrito;
    }

    public void setNombreDistrito(String nombreDistrito) {
        this.nombreDistrito = nombreDistrito;
    }

    public Integer getIdZonas() {
        return idZonas;
    }

    public void setIdZonas(Integer idZonas) {
        this.idZonas = idZonas;
    }
}