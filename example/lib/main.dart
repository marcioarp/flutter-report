import 'package:flutter/material.dart';
//import 'mapLayout.dart';
import 'package:report/flutter_report.dart';

var data1 = [
  {"name": "Jack"},
  {"name": "Jane"},
  {"name": "John"},
  {"name": "Mary"},
  {"name": "Paul"},
  {"name": "Kate"},
];

var data = [
  {
    "id_venda": "76E9F77-3IVARIQARIKYLEXAHEXE7A1I1YC",
    "num_venda": 4377,
    "id_cliente": "96266707-2O9IPEFUHY4EVEFYCICODO3E9O",
    "id_cliente_avalista": "",
    "id_socio": "",
    "id_vendedor": "77ba3083-bc4a-97be-ea27-a9828c960a68",
    "id_digitador": "d22ad610-ad3b-187f-f846-c98cd3ca85fd",
    "id_empresa": "1",
    "id_venda_os": "",
    "data": 1622109600000,
    "hora": "19:30:28",
    "desconto": 0,
    "desc_prod_total": 0,
    "frete": 0,
    "ipi": 0,
    "acrescimo": 0,
    "total": 1000.5,
    "total_produtos": 1000.5,
    "total_custo": 30,
    "total_custo_ponderado": 30,
    "obs":
        "TROCA EM ATÉ 7 DIAS MEDIANTE APRESENTAÇÃO DE COMPROVANTE DA COMPRA.        ASSINATURA",
    "ra_status_venda": "Finalizado",
    "ra_centro_custo": "",
    "valor_mensal": 0,
    "valor_promissoria": 0,
    "dt_primeira_mensalidade": "",
    "id_pdv": "b191caf8-5d80-d643-484a-e007174035a9",
    "nome": "JULIO FERRAZ PROJETOS E OBRAS LTDA",
    "endereco": "RUA ANGELO PAZIN Nº47",
    "num": "47",
    "complemento": "",
    "bairro": "JD PARAIBA ",
    "cidade": "APARECIDA",
    "uf": "SP",
    "cep": "12470000",
    "email":
        "ENIVALDO 3133-5504 marcioarp@gmail.com;marcio@viavalesistemas.com.br",
    "telefone": ".",
    "celular": "",
    "cpf": "03.426.403/0001-95",
    "ie_rg": "174143385114",
    "dt_nasc_cliente": "",
    "permitir_desconto": "N",
    "vibpt_mun": 0,
    "vibpt_est": 106.06,
    "vibpt_fed": 42.02,
    "vibpt_import": 0,
    "vibpt_total": 148.08,
    "vibpt_descricao":
        "Trib. Aprox. R 42,02 Fed.  R 106,06 Est.  Fonte IBPT/empresometro.com.br 397927 aqui !",
    "chave_fiscal": "35210524755982000190550010000080011213386748",
    "ra_tipo_doc_fiscal": "NFe",
    "id_doc_fiscal": "B983A04-7Y7U1AREVUMO9YZEQY3ASOCAVA6",
    "dt_emiss_fiscal": 1622109600000,
    "num_doc_fiscal": 8001,
    "num_doc_fiscal_esperado": 0,
    "num_doc_cancelamento": 0,
    "num_comanda": 0,
    "num_mesa": 0,
    "qr_code_comanda": "",
    "dt_locacao": "",
    "hr_locacao": "",
    "dt_retirada": "",
    "hr_retirada": "",
    "dt_retorno_estoque": "",
    "hr_retorno_estoque": "",
    "ra_status_locacao": "",
    "dt_comissao": "",
    "val_comissao": 0,
    "ra_canal_venda": "",
    "num_canal_venda": "",
    "delivery": "S",
    "num_doc_canc": 0,
    "chave_doc_canc": "",
    "xmlfile": "",
    "pdffile": "",
    "id_evento": "",
    "itens": [
      {
        "id_venda_item": "ef46f8c3-5d15-0009-dbb1-afd23b7b6ed2",
        "id_inc": 7382,
        "id_venda": "76E9F77-3IVARIQARIKYLEXAHEXE7A1I1YC",
        "id_produto": "4f4504e148d3b2b2c815396509809089",
        "qtd": 1,
        "qtd_pagar": 0,
        "val_unit": 650.5,
        "desconto": 0,
        "desconto_prod": 0,
        "acrescimo": 0,
        "frete": 0,
        "ipi": 0,
        "val_total": 650.5,
        "v_reposicao": 0,
        "qtd_estoque_atual": 0,
        "qtd_estoque_min": 0,
        "qtd_devol": 0,
        "v_custo": 0,
        "v_custo_ponderado": 0,
        "id_cfe": "",
        "cprod": "11",
        "cean": "",
        "xprod": ".PAO DE SAL AMANHECIDO",
        "cfop": "5102",
        "ncm": "19059090",
        "ucom": "KG",
        "ind_regra": "",
        "v_outro": 0,
        "ra_icms_orig": "0",
        "ra_icms_cst_csosn": "102",
        "ra_pis_cst": "49",
        "ra_confis_cst": "49",
        "num_item": 1,
        "vibpt_mun": 0,
        "vibpt_est": 78.06,
        "vibpt_fed": 27.32,
        "vibpt_import": 0,
        "vibpt_total": 0,
        "icms_picms": 0,
        "pis_vbc": 0,
        "pis_ppis": 0,
        "cofins_vbc": 0,
        "cofins_pcofins": 0,
        "info_adic": "",
        "vibpt_tabela": "IBPT/empresometro.com.br 397927",
        "ra_cest": "",
        "id_armazem": "12160fb0-26f6-f7e7-daf8-ff2e7100f0ad",
        "h_cfop_compra": "5102",
        "h_origem_cst_compra": "",
        "envia_cozinha": "N",
        "entregar_na_mesa": "N",
        "pedido_cliente": "N",
        "gerenciador_preparo": "N",
        "ra_status_venda_item": "",
        "dt_pedido_anotado": "",
        "hr_pedido_anotado": "",
        "id_produto_preparacao": "",
        "id_impressora_preparo": "",
        "val_min_v": 0,
        "valor1_v": 0,
        "valor2_v": 0,
        "valor3_v": 0,
        "valor4_v": 0,
        "valor5_v": 0,
        "valor6_v": 0,
        "valor7_v": 0,
        "valor8_v": 0,
        "valor9_v": 0
      },
      {
        "id_venda_item": "76ED4D1-QEVARESECIGY3O7IVAWYBYCY9O4",
        "id_inc": 7372,
        "id_venda": "76E9F77-3IVARIQARIKYLEXAHEXE7A1I1YC",
        "id_produto": "7CDC15ED-QAKE0I6YXEHE7E2ICODUXALAZO",
        "qtd": 5,
        "qtd_pagar": 0,
        "val_unit": 70,
        "desconto": 0,
        "desconto_prod": 0,
        "acrescimo": 0,
        "frete": 0,
        "ipi": 0,
        "val_total": 350,
        "v_reposicao": 0,
        "qtd_estoque_atual": -226,
        "qtd_estoque_min": 0,
        "qtd_devol": 0,
        "v_custo": 6,
        "v_custo_ponderado": 6,
        "id_cfe": "",
        "cprod": "7697",
        "cean": "",
        "xprod": "AREIA MEDIA",
        "cfop": "5102",
        "ncm": "25059000",
        "ucom": "M3",
        "ind_regra": "",
        "v_outro": 0,
        "ra_icms_orig": "0",
        "ra_icms_cst_csosn": "102",
        "ra_pis_cst": "49",
        "ra_confis_cst": "49",
        "num_item": 2,
        "vibpt_mun": 0,
        "vibpt_est": 28,
        "vibpt_fed": 14.7,
        "vibpt_import": 0,
        "vibpt_total": 42.7,
        "icms_picms": 0,
        "pis_vbc": 0,
        "pis_ppis": 0,
        "cofins_vbc": 0,
        "cofins_pcofins": 0,
        "info_adic": "",
        "vibpt_tabela": "IBPT/empresometro.com.br 397927",
        "ra_cest": "",
        "id_armazem": "48709adc-72d0-89a9-334f-698f94ee6ab6",
        "h_cfop_compra": "5101",
        "h_origem_cst_compra": "0102",
        "envia_cozinha": "N",
        "entregar_na_mesa": "N",
        "pedido_cliente": "N",
        "gerenciador_preparo": "N",
        "ra_status_venda_item": "",
        "dt_pedido_anotado": 1622109600000,
        "hr_pedido_anotado": "00:05:31",
        "id_produto_preparacao": "",
        "id_impressora_preparo": "",
        "val_min_v": 0,
        "valor1_v": 0,
        "valor2_v": 0,
        "valor3_v": 0,
        "valor4_v": 0,
        "valor5_v": 0,
        "valor6_v": 0,
        "valor7_v": 0,
        "valor8_v": 0,
        "valor9_v": 0
      }
    ],
    "pagamento": [
      {
        "id_pagamento": "344e25cd-d288-dde3-b3f3-17f1a0547bc1",
        "id_inc": 2649,
        "id_origem": "76E9F77-3IVARIQARIKYLEXAHEXE7A1I1YC",
        "origem": "venda",
        "id_pagamento_tipo": "4b9a9624-e858-fb76-62fa-c7d3b77a81ab",
        "ra_centro_custo": "",
        "valor": 650.5,
        "detalhes": "",
        "id_pdv": "",
        "id_produto_estoque": "",
        "qtd_produto_estoque": 0,
        "qr_code": "",
        "id_pix": ""
      },
      {
        "id_pagamento": "B98390C-XOPOSOLAHETO4IRYCO6U6AMAGE4",
        "id_inc": 2644,
        "id_origem": "76E9F77-3IVARIQARIKYLEXAHEXE7A1I1YC",
        "origem": "venda",
        "id_pagamento_tipo": "d9a0fc83-ae0e-6669-18c0-0de4e736ead9",
        "ra_centro_custo": "Sistema",
        "valor": 350,
        "detalhes": "Dinheiro: 350,00",
        "id_pdv": "",
        "id_produto_estoque": "",
        "qtd_produto_estoque": 0,
        "qr_code": "",
        "id_pix": ""
      }
    ]
  },
  {"nome": "Márcio Rossato", "endereco": "Av. Teste, 155"}
];

List<FRPage> pages = [
  FRPage(
      paperSize: FRPaperSize.a4,
      padding: FRPadding(top: 0.00, left: 5, right: 5, bottom: 0),
      bands: [
        FRBandStart(height: 20.00, margin: FRMargin(top: 5), children: [
          FRText(
              top: 10.00,
              text: 'Ola 10 [nome] [nome]',
              fontSize: 10,
              height: 5.00,
              backgroundColorRGB: FRRGBColor(0, 200, 200),
              textAlign: TextAlign.center,
              padding: FRPadding(left: 0, right: 0, top: 0, bottom: 0),
              width: 190.00),
          FRText(
              top: 1.00,
              text: 'Ola 8 [nome] [nome]',
              fontSize: 8,
              backgroundColorRGB: FRRGBColor(255, 200, 200),
              textAlign: TextAlign.center,
              padding: FRPadding(left: 0, right: 0),
              width: 100.00)
        ])
        /*,
        FRBandData(
            //backgroundColorRGB: FRRGBColor(255, 200, 200),
            height: 50.00,
            children: [
              FRLayout(bands: [
                FRBandData(
                    backgroundColorRGB: FRRGBColor(255, 200, 200),
                    height: 50.00,
                    children: [
                      FRText(
                          top: 0.00,
                          backgroundColorRGB: FRRGBColor(255, 120, 120),
                          padding: FRPadding(top: 2, left: 2),
                          text: 'ok [id_inc]',
                          fontSize: 8)
                    ])
              ])
            ])*/
      ])
];

var rel;
void main() {
  FlutterReport fr = FlutterReport(pages: pages, data: data);
  fr.prepare(devMode: true);
  rel = fr.result;
  runApp(MyScroll());
}

class MyScroll extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new MyHomePage(title: 'Flutter No Report'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double zoom = 3.00;
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
        actions: <Widget>[
          ElevatedButton.icon(
              label: Text(''), icon: Icon(Icons.print), onPressed: () {}),
          ElevatedButton.icon(
            label: Text(''),
            icon: Icon(Icons.picture_as_pdf),
            onPressed: () {},
          ),
          ElevatedButton.icon(
              label: Text(''),
              icon: Icon(Icons.zoom_out),
              onPressed: () {
                setState(() {
                  this.zoom -= 1.0;
                });
              }),
          ElevatedButton.icon(
              label: Text(''),
              icon: Icon(Icons.zoom_in),
              onPressed: () {
                setState(() {
                  this.zoom += 1.0;
                });
              }),
        ],
      ),
      body: new Center(
        child: new SingleChildScrollView(
          //scrollDirection: Axis.vertical,
          child: new CustomPaint(
            painter: new OutCanvas(rel, this.zoom),
            size: new Size(width, height * 2),
          ),
        ),
      ),
    );
  }
}
