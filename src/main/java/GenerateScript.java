import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.ss.usermodel.WorkbookFactory;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.util.Iterator;

public class GenerateScript {


    public static void main(String[] args) {

        if (args.length != 3) {
            throw new RuntimeException("Argumentos Invalidos");
        }
        File xlsx = new File(args[1]);
        final String outputFilePath = args[2];
        final String CUSTOMER = "{CUSTOMER}";
        final String PRODUCT = "{PRODUCT}";
        final String PRICE = "{PRICE}";
        final String COUNTRY = "{COUNTRY}";
        final String ZONE = "{ZONE}";
        final String AGREEMENT = "{AGREEMENT}";
        final String FINANCE = "{FINANCE}";
        final String SEGMENTATION = "{SEGMENTATION}";
        final String CUSTOMER_TYPE = "{CUSTOMER_TYPE}";
        final String STRATUM = "{STRATUM}";
        final String AR_CODE = "AR";
        final String CO_CODE = "CO";


        String queryTemp = "insert into DTV_PRICE_PRODUCT values(PRICE_PRODUCT_SEQ.NEXTVAL,\n" +
                "                (select id from DTV_PRICE_CUSTOMER where DESCRIPTION ='{CUSTOMER}'),\n" +
                "                (select id from DTV_PRICE_IBS_PRODUCTS where UPPER(DESCRIPTION) = UPPER('{PRODUCT}') and COUNTRY=(select CODE from DTV_PRICE_COUNTRIES where CODE='{COUNTRY}')),\n" +
                "                '{PRICE}',\n" +
                "                (select id from DTV_PRICE_COUNTRIES where CODE='{COUNTRY}'),\n" +
                "                1);\n";

        String queryZone = "insert into DTV_PRICE_PRODUCT_ZONE\n" +
                "values((select zone_id from DTV_PRICE_ZONE where DESCRIPTION='{ZONE}' and COUNTRY=(select CODE from DTV_PRICE_COUNTRIES where CODE='{COUNTRY}')) ,\n" +
                "PRICE_PRODUCT_SEQ.currval);\n\n";

        String queryAgreement = "insert into DTV_PRICE_PRODUCT_AGREEMENT\n" +
                "values((select agreement_id from DTV_PRICE_AGREEMENT where DESCRIPTION='{AGREEMENT}' and COUNTRY=(select CODE from DTV_PRICE_COUNTRIES where CODE='{COUNTRY}' and CUSTOMER_CLASS=(select CODE from DTV_PRICE_CUSTOMER where DESCRIPTION='{CUSTOMER}'))) ,\n" +
                "PRICE_PRODUCT_SEQ.currval);\n\n";

        String querySegmentation = "insert into DTV_PRICE_PRODUCT_SEGMENT\n" +
                "values((select SEGMENT_TYPE_ID from DTV_PRICE_SEGMENT_TYPE where DESCRIPTION='{SEGMENTATION}' and COUNTRY=(select CODE from DTV_PRICE_COUNTRIES where CODE='{COUNTRY}' )) ,\n" +
                "PRICE_PRODUCT_SEQ.currval);\n\n";

        String queryFinance = "insert into DTV_PRICE_PRODUCT_FINANCE\n" +
                "values((select finance_id from DTV_PRICE_FINANCE where DESCRIPTION='{FINANCE}' and COUNTRY=(select CODE from DTV_PRICE_COUNTRIES where CODE='{COUNTRY}') and CUSTOMER_CLASS=(select CODE from DTV_PRICE_CUSTOMER where DESCRIPTION='{CUSTOMER}')) ,\n" +
                "PRICE_PRODUCT_SEQ.currval);\n\n";

        String queryCustomerType = "insert into DTV_PRICE_PROD_CUST_TYPE\n" +
                "values((select CUSTOMER_TYPE_ID from DTV_PRICE_CUSTOMER_TYPE where DESCRIPTION='{CUSTOMER_TYPE}' and COUNTRY=(select CODE from DTV_PRICE_COUNTRIES where CODE='{COUNTRY}' and CUSTOMER_CLASS=(select CODE from DTV_PRICE_CUSTOMER where DESCRIPTION='{CUSTOMER}'))) ,\n" +
                "PRICE_PRODUCT_SEQ.currval);\n\n";

        String queryStratum = "insert into DTV_PRICE_PRODUCT_STRATUM\n" +
                "values((select STRATUM_ID from DTV_PRICE_STRATUM where DESCRIPTION='{STRATUM}' and COUNTRY=(select CODE from DTV_PRICE_COUNTRIES where CODE='{COUNTRY}'  and CUSTOMER_CLASS=(select CODE from DTV_PRICE_CUSTOMER where DESCRIPTION='{CUSTOMER}'))) ,\n" +
                "PRICE_PRODUCT_SEQ.currval);\n\n";

        System.out.println("Nombres de Columnas");

        try (Workbook wb = WorkbookFactory.create(xlsx)) {
            Sheet sheet = wb.getSheetAt(0);
            Iterator<Row> rowIterator = sheet.rowIterator();
            Iterator<Cell> cellHeaderIterator = rowIterator.next().cellIterator();
            while (cellHeaderIterator.hasNext()) {
                String headerColumTitle = cellHeaderIterator.next().getStringCellValue();
                System.out.println(headerColumTitle);
            }

            Row rowData;
            String q = queryTemp;
            String qZone = queryZone;
            String qAgreement = queryAgreement;
            String qSegmentation = querySegmentation;
            String qFinance = queryFinance;
            String qCustType = queryCustomerType;
            String qStratum = queryStratum;
            String customerCellValue;
            if (args[0].equalsIgnoreCase("AR")) {

                while (rowIterator.hasNext()) {
                    rowData = rowIterator.next();
                    q = q.replace(PRODUCT, rowData.getCell(0).getStringCellValue().toUpperCase());
                    q = q.replace(COUNTRY, AR_CODE);

                    customerCellValue = rowData.getCell(2).getStringCellValue();

                    q = q.replace(CUSTOMER, customerCellValue);
                    q = q.replace(PRICE, String.valueOf(rowData.getCell(6).getNumericCellValue()));

                    appendStringToFile(q, outputFilePath);
                    //Zone multi
                    String[] zoneValues = rowData.getCell(1).getStringCellValue().split(",");
                    for (int i = 0; i < zoneValues.length; i++) {
                        qZone = qZone.replace(ZONE, zoneValues[i].trim()).replace(COUNTRY, AR_CODE);
                        appendStringToFile(qZone, outputFilePath);
                        qZone = queryZone;
                    }

                    //Agreement multi
                    String[] agreementValues = rowData.getCell(4).getStringCellValue().split(",");
                    for (int i = 0; i < agreementValues.length; i++) {
                        qAgreement = qAgreement.replace(AGREEMENT, agreementValues[i].trim())
                                .replace(COUNTRY, AR_CODE)
                                .replace(CUSTOMER, customerCellValue);
                        appendStringToFile(qAgreement, outputFilePath);
                        qAgreement = queryAgreement;
                    }

                    //Segmentation multi
                    String[] segValues = rowData.getCell(3).getStringCellValue().split(",");
                    for (int i = 0; i < segValues.length; i++) {
                        qSegmentation = qSegmentation.replace(SEGMENTATION, segValues[i].trim())
                                .replace(COUNTRY, AR_CODE);
                        appendStringToFile(qSegmentation, outputFilePath);
                        qSegmentation = querySegmentation;
                    }

                    //Finance
                    qFinance = qFinance.replace(FINANCE, rowData.getCell(5).getStringCellValue().trim())
                            .replace(COUNTRY, AR_CODE)
                            .replace(CUSTOMER, customerCellValue);
                    appendStringToFile(qFinance, outputFilePath);
                    qFinance = queryFinance;

                    q = queryTemp;

                }
            } else if (args[0].equalsIgnoreCase("CO")) {
                while (rowIterator.hasNext()) {
                    rowData = rowIterator.next();
                    q = q.replace(PRODUCT, rowData.getCell(0).getStringCellValue());
                    q = q.replace(COUNTRY, CO_CODE);

                    customerCellValue = rowData.getCell(2).getStringCellValue();

                    q = q.replace(CUSTOMER, customerCellValue);
                    q = q.replace(PRICE, String.valueOf(rowData.getCell(8).getNumericCellValue()));

                    appendStringToFile(q, outputFilePath);
                    //Zone multi
                    String[] zoneValues = rowData.getCell(1).getStringCellValue().split(",");
                    for (int i = 0; i < zoneValues.length; i++) {
                        qZone = qZone.replace(ZONE, zoneValues[i].trim()).replace(COUNTRY, CO_CODE);
                        appendStringToFile(qZone, outputFilePath);
                        qZone = queryZone;
                    }

                    //Agreement multi
                    String[] agreementValues = rowData.getCell(5).getStringCellValue().split(",");
                    for (int i = 0; i < agreementValues.length; i++) {
                        qAgreement = qAgreement.replace(AGREEMENT, agreementValues[i].trim())
                                .replace(COUNTRY, CO_CODE)
                                .replace(CUSTOMER, customerCellValue);
                        appendStringToFile(qAgreement, outputFilePath);
                        qAgreement = queryAgreement;
                    }

                    //Segmentation multi
                    String[] segValues = rowData.getCell(4).getStringCellValue().split(",");
                    for (int i = 0; i < segValues.length; i++) {
                        qSegmentation = qSegmentation.replace(SEGMENTATION, segValues[i].trim())
                                .replace(COUNTRY, CO_CODE);
                        appendStringToFile(qSegmentation, outputFilePath);
                        qSegmentation = querySegmentation;
                    }

                    //Finance
                    qFinance = qFinance.replace(FINANCE, rowData.getCell(6).getStringCellValue().trim())
                            .replace(COUNTRY, CO_CODE)
                            .replace(CUSTOMER, customerCellValue);
                    appendStringToFile(qFinance, outputFilePath);
                    qFinance = queryFinance;

                    //Customer Type multi
                    String[] custTypeValues = rowData.getCell(3).getStringCellValue().split(",");
                    for (int i = 0; i < custTypeValues.length; i++) {
                        qCustType = qCustType.replace(CUSTOMER_TYPE, custTypeValues[i].trim())
                                .replace(CUSTOMER, customerCellValue)
                                .replace(COUNTRY, CO_CODE);
                        appendStringToFile(qCustType, outputFilePath);
                        qCustType = queryCustomerType;
                    }

                    //Stratum multi
                    String[] stratumValues = rowData.getCell(7).getStringCellValue().split(",");
                    for (int i = 0; i < stratumValues.length; i++) {
                        qStratum = qStratum.replace(STRATUM, stratumValues[i].trim())
                                .replace(CUSTOMER, customerCellValue)
                                .replace(COUNTRY, CO_CODE);
                        appendStringToFile(qStratum, outputFilePath);
                        qStratum = queryStratum;
                    }
                    q = queryTemp;

                }

            }

        } catch (Exception e) {
            System.out.println(e);
        }


    }

    public static void appendStringToFile(String data, String filePath) {
        try {
            BufferedWriter bw = new BufferedWriter(new FileWriter(filePath, true));
            bw.write(data);
            bw.flush();
            bw.close();
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

}
