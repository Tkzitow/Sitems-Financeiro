object DataModule1: TDataModule1
  Height = 269
  Width = 456
  object conexao: TFDConnection
    Params.Strings = (
      'Database=dofs'
      'User_Name=root'
      'Password=123456'
      'DriverID=MySQL')
    Connected = True
    Left = 24
    Top = 16
  end
  object Query1: TFDQuery
    Connection = conexao
    UpdateOptions.AssignedValues = [uvUpdateMode]
    UpdateOptions.UpdateMode = upWhereAll
    SQL.Strings = (
      'select * from usuarios')
    Left = 24
    Top = 88
  end
  object FDPhysMySQLDriverLink1: TFDPhysMySQLDriverLink
    VendorLib = 'C:\Software_dofs\dll32\libmysql.dll'
    Left = 184
    Top = 24
  end
  object DataSource1: TDataSource
    DataSet = Query2
    Left = 192
    Top = 144
  end
  object Query2: TFDQuery
    Connection = conexao
    UpdateOptions.AssignedValues = [uvUpdateMode]
    UpdateOptions.UpdateMode = upWhereAll
    SQL.Strings = (
      'select * from saidas')
    Left = 88
    Top = 104
  end
  object DataSource2: TDataSource
    DataSet = Query1
    Left = 192
    Top = 200
  end
end