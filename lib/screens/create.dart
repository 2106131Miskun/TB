import 'package:belajar_array_crud/models/mahasiswa.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

enum FormMode { create, edit }

class CreateEditScreen extends StatefulWidget {
  const CreateEditScreen({super.key, required this.mode, this.mahasiswa});

  final FormMode mode;
  final Mahasiswa? mahasiswa;

  @override
  State<CreateEditScreen> createState() => _CreateEditScreenState();
}

class _CreateEditScreenState extends State<CreateEditScreen> {
  final TextEditingController _nimController = TextEditingController();
  final TextEditingController _namaController = TextEditingController();
  final TextEditingController _kelasController = TextEditingController();
  final TextEditingController _prodiController = TextEditingController();
  final TextEditingController _jurusanController = TextEditingController();
  final TextEditingController _fakultasController = TextEditingController();

  @override
  initState() {
    super.initState();
    if (widget.mode == FormMode.edit) {
      _nimController.text = widget.mahasiswa!.nim;
      _namaController.text = widget.mahasiswa!.nama;
      _kelasController.text = widget.mahasiswa!.kelas;
      _prodiController.text = widget.mahasiswa!.prodi;
      _jurusanController.text = widget.mahasiswa!.jurusan;
      _fakultasController.text = widget.mahasiswa!.fakultas;
    }
  }

  Mahasiswa getMhs() {
    return Mahasiswa(
      nim: _nimController.text,
      nama: _namaController.text,
      kelas: _kelasController.text,
      prodi: _prodiController.text,
      jurusan: _jurusanController.text,
      fakultas: _fakultasController.text,
    );
  }

  Widget _buildFormRow(
      String prefixText, TextEditingController controller, String placeholder) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.blue, // warna border
          width: 2.0, // ketebalan border
        ),
        borderRadius: BorderRadius.circular(8.0), // radius border
      ),
      margin: EdgeInsets.symmetric(vertical: 5.0), // jarak antar kolom
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: CupertinoFormRow(
          prefix: Text(prefixText),
          child: CupertinoTextFormFieldRow(
            controller: controller,
            placeholder: placeholder,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: const Text('Data Mahasiswa'),
        trailing: GestureDetector(
          onTap: () {
            Navigator.pop(context, getMhs());
          },
          child: FaIcon(
            widget.mode == FormMode.create
                ? FontAwesomeIcons.plus
                : FontAwesomeIcons.pencil,
            size: 18,
          ),
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.pink[200]!, Colors.blue[300]!],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SafeArea(
          child: CupertinoFormSection(
            header: Text(widget.mode == FormMode.create
                ? 'Tambah Data Mahasiswa'
                : 'Edit Data Mahasiswa'),
            children: [
              _buildFormRow('NIM', _nimController, 'Masukkan NIM'),
              _buildFormRow('Nama', _namaController, 'Masukkan Nama'),
              _buildFormRow('Kelas', _kelasController, 'Masukkan Kelas'),
              _buildFormRow('Prodi', _prodiController, 'Masukkan Prodi'),
              _buildFormRow('Jurusan', _jurusanController, 'Masukkan Jurusan'),
              _buildFormRow(
                  'Fakultas', _fakultasController, 'Masukkan Fakultas'),
            ],
          ),
        ),
      ),
    );
  }
}
