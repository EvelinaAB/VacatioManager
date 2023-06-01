package com.web.vacatio;

import java.sql.Date;
public class Solicitud {
    private int id;
    private String nombre;
    private String apellidos;
    private Date fechaInicio;
    private Date fechaFin;
    private String descripcion;
    private String estado;
  

    public Solicitud(int id, String nombre, String apellidos, Date fechaInicio2, Date fechaFin2, String descripcion, String estado) {
        this.id = id;
        this.setNombre(nombre);
        this.setApellidos(apellidos);
        this.fechaInicio = fechaInicio2;
        this.fechaFin = fechaFin2;
        this.descripcion = descripcion;
        this.setEstado(estado);
    }


	public Solicitud (int id,  Date fechaInicio, Date fechaFin, String descripcion) {
		this.id = id;
   
        this.fechaInicio = fechaInicio;
        this.fechaFin = fechaFin;
        this.descripcion = descripcion;
       
	}

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Date getFechaInicio() {
        return fechaInicio;
    }

    public void setFechaInicio(Date date) {
        this.fechaInicio = date;
    }

    public Date getFechaFin() {
        return fechaFin;
    }

    public void setFechaFin(Date fechaFin) {
        this.fechaFin = fechaFin;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

	public String getEstado() {
		return estado;
	}

	public void setEstado(String estado) {
		this.estado = estado;
	}

	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public String getApellidos() {
		return apellidos;
	}

	public void setApellidos(String apellidos) {
		this.apellidos = apellidos;
	}
}
