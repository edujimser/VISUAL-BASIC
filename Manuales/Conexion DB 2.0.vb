Imports System.Data.SqlClient
Imports Microsoft.SqlServer
Imports Microsoft.VisualBasic.ApplicationServices

Public Class conexion
    Public conn As SqlConnection

    Public Sub New()
        conn = New SqlConnection("Data Source=WINDOWS10;Initial Catalog=dbsistema;Persist Security Info=True;User ID=sa;Password=1234")
    End Sub
End Class
