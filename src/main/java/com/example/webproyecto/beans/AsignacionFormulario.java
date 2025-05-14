package com.example.webproyecto.beans;

import java.util.Date;

public class AsignacionFormulario {
    private int idAsignacionFormularios;
    private int idEncuestador;
    private int idFormulario;
    private Date fechaAsignacion;
    private String estado;

    private Formulario formulario;

    public int getIdAsignacionFormularios() {
        return idAsignacionFormularios;
    }

    public void setIdAsignacionFormularios(int idAsignacionFormularios) {
        this.idAsignacionFormularios = idAsignacionFormularios;
    }

    public int getIdEncuestador() {
        return idEncuestador;
    }

    public void setIdEncuestador(int idEncuestador) {
        this.idEncuestador = idEncuestador;
    }

    public int getIdFormulario() {
        return idFormulario;
    }

    public void setIdFormulario(int idFormulario) {
        this.idFormulario = idFormulario;
    }

    public Date getFechaAsignacion() {
        return fechaAsignacion;
    }

    public void setFechaAsignacion(Date fechaAsignacion) {
        this.fechaAsignacion = fechaAsignacion;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

    public Formulario getFormulario() {
        return formulario;
    }

    public void setFormulario(Formulario formulario) {
        this.formulario = formulario;
    }

}
