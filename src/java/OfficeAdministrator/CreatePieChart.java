/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package OfficeAdministrator;

import java.io.File;
import java.io.InputStream;
import java.net.URL;
import java.sql.ResultSet;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.Date;
import org.jfree.chart.ChartFactory;
import org.jfree.chart.ChartUtilities;
import org.jfree.chart.JFreeChart;
import org.jfree.chart.plot.PlotOrientation;
import org.jfree.data.category.DefaultCategoryDataset;
import org.jfree.data.general.DefaultPieDataset;

/**
 *
 * @author Rachna
 */
public class CreatePieChart  {
   public void createCharts() throws Exception
//public static void main(String args[]) throws Exception
   {
       
      int open=0;
      int closed=0;
      
      /* Create MySQL Database Connection */
             Statement st = DBConnector.getStatement();
             Date date=new Date(System.currentTimeMillis());
             SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
             String query="SELECT COUNT(CallStatus) FROM calls WHERE CallStatus='Open' and Date='"+sdf.format(date)+"'";
            ResultSet resultSet = st.executeQuery(query);
      DefaultPieDataset dataset = new DefaultPieDataset( );
      if( resultSet.next( ) ){ 
         open=Integer.parseInt(resultSet.getString(1));         
      }
      
      
      query="SELECT COUNT(CallStatus) FROM calls WHERE CallStatus='Closed' and Date='"+sdf.format(date)+"'";
      System.out.println(query);
      resultSet=st.executeQuery(query);
      
      if( resultSet.next( ) ){ 
         closed=Integer.parseInt(resultSet.getString(1));         
      }
      dataset.setValue("Open",open);
      dataset.setValue("Closed",closed);
      
      JFreeChart chart = ChartFactory.createPieChart(
         "Call Summary",  // chart title           
         dataset,         // data           
         true,            // include legend          
         true,           
         false );

      int width = 560; /* Width of the image */
      int height = 370; /* Height of the image */
      
      File pieChart = new File("C:\\Users\\Rachna\\Documents\\NetBeansProjects\\OfficeAdministrator\\web\\images\\CallStatus_Chart.jpeg" );
       // File pieChart = new File("/../web/images/CallStatus_Chart.jpeg");
   // File f = new File("OfficeAdministrator/web/images/CallStatus_Chart.jpeg");
    //System.out.println(f.getAbsolutePath());
    //File pieChart = new File(f.getAbsolutePath());
      
     
        ChartUtilities.saveChartAsJPEG( pieChart , chart , width , height );
      
      
      //Call details according to Department
      DefaultCategoryDataset dataset1 = new DefaultCategoryDataset( );
      int accopen=0,accclosed=0,markopen=0,markclosed=0,seropen=0,serclosed=0,stopen=0,stclosed=0,diropen=0,dirclosed=0,foopen=0,foclosed=0;
      
      query="SELECT COUNT(*) FROM calls WHERE TransferredTo='Accounts' and CallStatus='Closed' and Date='"+sdf.format(date)+"'";
      System.out.println(query);
      resultSet=st.executeQuery(query);       
      if(resultSet.next( ))
         accclosed=Integer.parseInt(resultSet.getString(1));         
      
      query="SELECT COUNT(*) FROM calls WHERE TransferredTo='Accounts' and CallStatus='Open' and Date='"+sdf.format(date)+"'";
      System.out.println(query);
      resultSet=st.executeQuery(query);       
      if(resultSet.next( ))
         accopen=Integer.parseInt(resultSet.getString(1));         
      
      query="SELECT COUNT(*) FROM calls WHERE TransferredTo='Marketing' and CallStatus='Closed' and Date='"+sdf.format(date)+"'";
      System.out.println(query);
      resultSet=st.executeQuery(query);       
      if(resultSet.next( ))
         markclosed=Integer.parseInt(resultSet.getString(1));         
      
      query="SELECT COUNT(*) FROM calls WHERE TransferredTo='Marketing' and CallStatus='Open' and Date='"+sdf.format(date)+"'";
      System.out.println(query);
      resultSet=st.executeQuery(query);       
      if(resultSet.next( ))
         markopen=Integer.parseInt(resultSet.getString(1));         
      
      query="SELECT COUNT(*) FROM calls WHERE TransferredTo='Service' and CallStatus='Closed' and Date='"+sdf.format(date)+"'";
      System.out.println(query);
      resultSet=st.executeQuery(query);       
      if(resultSet.next( ))
         serclosed=Integer.parseInt(resultSet.getString(1));         
      
      query="SELECT COUNT(*) FROM calls WHERE TransferredTo='Service' and CallStatus='Open' and Date='"+sdf.format(date)+"'";
      System.out.println(query);
      resultSet=st.executeQuery(query);       
      if(resultSet.next( ))
         seropen=Integer.parseInt(resultSet.getString(1));         
      
      query="SELECT COUNT(*) FROM calls WHERE TransferredTo='Stores' and CallStatus='Closed' and Date='"+sdf.format(date)+"'";
      System.out.println(query);
      resultSet=st.executeQuery(query);       
      if(resultSet.next( ))
         stclosed=Integer.parseInt(resultSet.getString(1));         
      
      query="SELECT COUNT(*) FROM calls WHERE TransferredTo='Stores' and CallStatus='Open' and Date='"+sdf.format(date)+"'";
      System.out.println(query);
      resultSet=st.executeQuery(query);       
      if(resultSet.next( ))
         stopen=Integer.parseInt(resultSet.getString(1));         
      
      query="SELECT COUNT(*) FROM calls WHERE TransferredTo='Director' and CallStatus='Closed' and Date='"+sdf.format(date)+"'";
      System.out.println(query);
      resultSet=st.executeQuery(query);       
      if(resultSet.next( ))
         dirclosed=Integer.parseInt(resultSet.getString(1));         
      
      query="SELECT COUNT(*) FROM calls WHERE TransferredTo='Director' and CallStatus='Open' and Date='"+sdf.format(date)+"'";
      System.out.println(query);
      resultSet=st.executeQuery(query);       
      if(resultSet.next( ))
         diropen=Integer.parseInt(resultSet.getString(1));         
      
      query="SELECT COUNT(*) FROM calls WHERE TransferredTo='None' and CallStatus='Closed' and Date='"+sdf.format(date)+"'";
      System.out.println(query);
      resultSet=st.executeQuery(query);       
      if(resultSet.next( ))
         foclosed=Integer.parseInt(resultSet.getString(1));         
      
      query="SELECT COUNT(*) FROM calls WHERE TransferredTo='None' and CallStatus='Open' and Date='"+sdf.format(date)+"'";
      System.out.println(query);
      resultSet=st.executeQuery(query);       
      if(resultSet.next( ))
         foopen=Integer.parseInt(resultSet.getString(1));         
      
      
      dataset1.setValue(accopen,"Open","Accounts");
      dataset1.setValue(accclosed,"Closed","Accounts");
      dataset1.setValue(diropen,"Open","Director");
      dataset1.setValue(dirclosed,"Closed","Director");
      dataset1.setValue(foopen,"Open","Front Office");
      dataset1.setValue(foclosed,"Closed","Front Office");
      dataset1.setValue(markopen,"Open","Marketing");
      dataset1.setValue(markclosed,"Closed","Marketing");
      dataset1.setValue(seropen,"Open","Service");
      dataset1.setValue(serclosed,"Closed","Service");
      dataset1.setValue(stopen,"Open","Stores");
      dataset1.setValue(stclosed,"Closed","Stores");
      
      JFreeChart chart1 = ChartFactory.createBarChart(
         "Call Summary",  // chart title 
         "Department",
         "No of Calls",
         dataset1,         // data
         PlotOrientation.VERTICAL,
         true,            // include legend          
         true,           
         false );

      File callChart = new File("C:\\Users\\Rachna\\Documents\\NetBeansProjects\\OfficeAdministrator\\web\\images\\CallSum_Chart.jpeg" );
      ChartUtilities.saveChartAsJPEG( callChart , chart1 , width , height );
   }
}

