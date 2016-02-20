unit clsManufacturer;
interface

uses Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes;

type

  TManufacturer = class
  Private
    fmanufacturer_id: Integer;
    fname: String;
    fimage: String;
    fsort_order: Integer;

  Public
    Property Manufacturer_id: Integer read fmanufacturer_id write fmanufacturer_id;
    Property Name: String read fname write fname;
    Property Image: String read fimage write fimage;
    Property Sort_order: Integer read fsort_order write fsort_order;

  end;
  implementation


end.

