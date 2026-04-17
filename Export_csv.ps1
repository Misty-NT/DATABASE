Public Sub ExportAllTablesToCSV()

    Dim db As DAO.Database
    Dim tdf As DAO.TableDef
    Dim exportPath As String
    
    exportPath = "C:\NetworkTitan\DB\"   ' <-- CHANGE THIS
    
    Set db = CurrentDb
    
    For Each tdf In db.TableDefs
    
        ' Skip system tables
        If Left(tdf.Name, 4) <> "MSys" Then
        
            DoCmd.TransferText _
                TransferType:=acExportDelim, _
                TableName:=tdf.Name, _
                FileName:=exportPath & tdf.Name & ".csv", _
                HasFieldNames:=True
                
        End If
        
    Next tdf

    MsgBox "Export Complete!"

End Sub
