<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  version="1.0"
  xmlns:redirect="http://xml.apache.org/xalan/redirect"
  extension-element-prefixes="redirect"
  xmlns:xalan="http://xml.apache.org/xalan">
<xsl:output method="html" indent="yes" xalan:indent-amount="4"/>
<xsl:strip-space elements="*"/>
  <xsl:template match="/">
    <HTML>

      <HEAD>
        <TITLE></TITLE>
      </HEAD>

      <BODY>
        <font face = 'Arial' size = '1.75' color = 'black'>
        <B><xsl:text>QUESTION INFO:</xsl:text></B>
        <!-- TABLE of QUESTION INFO -->
        <table border="0" bgcolor="#e3e3e4" align="center">
          <tr>
            <th>Content Item Name       |</th>
            <th>Content Item ID       |</th>
            <th>Marked Status      |</th>
            <th>Flagged Status     |</th>
            <th>Avg % Correct:     |</th>
          </tr>
          <xsl:for-each select="question">
            <tr>
              <td><xsl:value-of select="interactionState/contentItem/@name" /></td>
              <td><xsl:value-of select="@contentItemId" /></td>
              <td><xsl:value-of select="interactionState/contentItem/mark/@marked" /></td>
              <!--"Flagged status" means item was added to "My Questions" -->
              <td><xsl:value-of select="interactionState/contentItem/flag/@isFlagged" /></td>
              <td><xsl:value-of select="@averagePercentCorrect" /></td>
            </tr>
          </xsl:for-each>
        </table>


        <xsl:choose>
         <xsl:when test="/question/tab">
           <table border="0" bgcolor="yellow" align="center">
             <tr>
               <th>Bonus Tab Content</th>
             </tr>
             <xsl:for-each select="question/tab/flashMediaObject">
               <tr>
                 <td><xsl:value-of select=".//@fileName" /></td>
               </tr>
             </xsl:for-each>
           </table>
          </xsl:when>
         <xsl:otherwise></xsl:otherwise>
        </xsl:choose>


        <!-- TEXT STRING of Question Info
          <B><xsl:text>QUESTION INFO </xsl:text></B>
          <p>
            <xsl:for-each select="question/interactionState/contentItem">
              <xsl:text>Content Item ID: </xsl:text><xsl:value-of select="@name" />
              <xsl:text>Marked? </xsl:text><xsl:value-of select="mark/@marked" />
              <xsl:text>Flagged: </xsl:text><xsl:value-of select="flag/@isFlagged" />
            </xsl:for-each>
          </p>
        <B><xsl:text>Keywords: </xsl:text></B>
       -->

       <p></p>

       <B><xsl:text>KEYWORDS:  </xsl:text></B>
        <!-- TABLE OF KEYWORDS -->
          <xsl:for-each select="question/categoryRefs">
          <!--replace "." with "_" characters -->
          <dataset> <xsl:text>#</xsl:text><xsl:value-of select="translate(catRef-USMLEStep2SimR-specialty/@categoryName, '.', '_')"/> </dataset><xsl:text>, </xsl:text>
          <xsl:text>#</xsl:text><xsl:value-of select="catRef-USMLEStep2SimR-subspecialty/@categoryName" /><xsl:text>, </xsl:text>
          <xsl:text>#</xsl:text><xsl:value-of select="catRef-s2qbankSpecialty/@categoryName" /><xsl:text>, </xsl:text>
          <xsl:text>#</xsl:text><xsl:value-of select="catRef-s2plsSubSpecialty/@categoryName" /><xsl:text>, </xsl:text>
          <xsl:text>#</xsl:text><xsl:value-of select="catRef-s2qbankTopicPed" /><xsl:text>, </xsl:text>
          <xsl:text>#</xsl:text><xsl:value-of select="catRef-s2Topic" /><xsl:text>, </xsl:text>
          <xsl:text>#</xsl:text><xsl:value-of select="catRef-s2qbankTopicIM/@categoryName" /><xsl:text>, </xsl:text>
          <xsl:text>#EOC_</xsl:text><xsl:value-of select="catRef-EOC/@categoryName" /><xsl:text>, </xsl:text>
          <xsl:text>#</xsl:text><xsl:value-of select="catRef-USMLEStep2SimR-task/@categoryName" /><xsl:text>, </xsl:text>
          <xsl:text>#MultiMedia_</xsl:text><xsl:value-of select="catRef-MultMediaQuestion/@categoryName" /><xsl:text>, </xsl:text>
          </xsl:for-each>

          <xsl:for-each select="/question/answer-choice-set">
            <xsl:choose>
             <xsl:when test=".//answer-choice/@correct='yes'">
               <dataset> <xsl:text>#</xsl:text><xsl:value-of select="translate(node(), ' ,','__')"/>
              </dataset>
              </xsl:when>
             <xsl:otherwise></xsl:otherwise>
            </xsl:choose>
            <xsl:text>, </xsl:text>
          </xsl:for-each>

          <xsl:for-each select="/question/interactionState/contentItem">
            <xsl:choose>
             <xsl:when test=".//mark/@marked='True'">
               <xsl:text>#marked</xsl:text>
              </xsl:when>
             <xsl:otherwise></xsl:otherwise>
            </xsl:choose>
            <xsl:text>, </xsl:text>
          </xsl:for-each>

        <!-- TABLE OF KEYWORDS -->
        <table border="0 solid" bgcolor="#e3e3e4" align="center">
          <tr>
            <!-- ROW_01 COL_01 -->
            <td><B>USMLEStep2SimR-specialty: </B></td>
            <!-- ROW_01 COL_02 -->
            <td><B>USMLEStep2SimR-subspecialty: </B></td>
            <!-- ROW_01 COL_03 -->
            <td><B>s2qbankSpecialty: </B></td>
            <!-- ROW_01 COL_04 -->
            <td><B>s2plsSubSpecialty: </B></td>
          </tr>

          <tr>
            <xsl:for-each select="question/categoryRefs">
            <!-- ROW_02 COL_01 -->
            <td><xsl:text>#</xsl:text><xsl:value-of select="catRef-USMLEStep2SimR-specialty/@categoryName" /></td>
            <!-- ROW_02 COL_02 -->
            <td><xsl:text>#</xsl:text><xsl:value-of select="catRef-USMLEStep2SimR-subspecialty/@categoryName" /></td>
            <!-- ROW_02 COL_03 -->
            <td><xsl:text>#</xsl:text><xsl:value-of select="catRef-s2qbankSpecialty/@categoryName" /></td>
            <!-- ROW_02 COL_04 -->
            <td><xsl:text>#</xsl:text><xsl:value-of select="catRef-s2plsSubSpecialty/@categoryName" /></td>
            </xsl:for-each>
          </tr>

          <!-- ROW 03 -->
          <tr>
            <td> </td>
            <td> </td>
            <td> </td>
            <td> </td>
          </tr>

          <tr>
            <!-- ROW_04 COL_01 -->
            <td><B>s2qbankTopicPed: </B></td>
            <!-- ROW_04 COL_02 -->
            <td><B>s2Topic: </B></td>
            <!-- ROW_04 COL_03 -->
            <td><B>s2qbankTopicIM: </B></td>
            <!-- ROW_04 COL_04 -->
            <td><B> </B></td>
          </tr>

          <tr>
            <xsl:for-each select="question/categoryRefs">
            <!-- ROW_05 COL_01 -->
            <td><xsl:text>#</xsl:text><xsl:value-of select="catRef-s2qbankTopicPed" /></td>
            <!-- ROW_05 COL_02 -->
            <td><xsl:text>#</xsl:text><xsl:value-of select="catRef-s2Topic" /></td>
            <!-- ROW_05 COL_03 -->
            <td><xsl:text>#</xsl:text><xsl:value-of select="catRef-s2qbankTopicIM/@categoryName" /></td>
            <!-- ROW_05 COL_04 -->
            <td></td>
            </xsl:for-each>
          </tr>

          <tr>
            <!-- ROW_06 COL_01 -->
            <td><B>EOC</B></td>
            <!-- ROW_06 COL_02 -->
            <td><B>USMLEStep2SimR-task</B></td>
            <!-- ROW_06 COL_02 -->
            <td><B>Multimedia Question?</B></td>
            <td><B></B></td>
          </tr>

          <tr>
            <xsl:for-each select="question/categoryRefs">
            <!-- ROW_04 COL_01 -->
            <td><xsl:text>#EOC_</xsl:text><xsl:value-of select="catRef-EOC/@categoryName" /></td>
            <!-- ROW_04 COL_02 -->
            <td><xsl:text>#</xsl:text><xsl:value-of select="catRef-USMLEStep2SimR-task/@categoryName" /></td>
            <!-- ROW_04 COL_03 -->
            <td><xsl:text>#MultiMedia_</xsl:text><xsl:value-of select="catRef-MultMediaQuestion/@categoryName" /></td>
            </xsl:for-each>
          </tr>

        </table>

        <!-- TEXT STRING of catRefs and #(values)
        <xsl:for-each select="question/categoryRefs/*">
          <xsl:value-of select="name()"/>
          <xsl:text>: #</xsl:text>
          <xsl:value-of select="./@categoryName" />
          <xsl:text>, </xsl:text>
        </xsl:for-each>
        -->

        <!-- TEXT STRING of catRefs and #(values)
          <p></p>
        <B><U><xsl:text>STIMULUS</xsl:text></U></B>
          <p></p>
        <B><xsl:text>ANSWER CHOICE SET</xsl:text></B>
          <p></p>
        <B><U><xsl:text>EXPLANATION</xsl:text></U></B>
          <p></p>
        <B><U><xsl:text>REMEDIATION / REKAP</xsl:text></U></B>
      -->

        <xsl:apply-templates/>
      </font>
      </BODY>
    </HTML>
  </xsl:template>

  <!-- Template for [[removing (highlighting) contents]] -->
  <xsl:template match="//highlighting" >
    <P><I><font color="black"/></I></P>
  </xsl:template>

  <!-- Template for [[removing (answer-choice) contents]] -->
  <xsl:template match="//answer-choice" >
    <P><I><font color="black"/></I></P>
  </xsl:template>


  <!-- Template for [[italicizing (contentItem) contents]] -->
  <xsl:template match="question/interactionState/contentItem" >
    <P><I><xsl:apply-templates/></I></P>
  </xsl:template>

  <!-- Template for [[bolding (stimulus) contents]] -->
  <xsl:template match="question/stimulus/*" >
    <P><xsl:apply-templates/></P>
  </xsl:template>

  <!-- Template for [[formatting (answer-choice-set) layout]] -->
  <xsl:template match="question/answer-choice-set" >
    <P><B><U>
      <xsl:text>ANSWER-CHOICE-SET:</xsl:text></U></B>
      <p></p>
      <xsl:apply-templates/></P>
  </xsl:template>

  <xsl:template match="//question/answer-choice-set" >
       <table border="02 solid" bgcolor="#e3e3e4" align="center">
         <xsl:for-each select=".//answer-choice">
           <tr>
           <!-- ".//answer-choice" lists all the descendents of the current node -->
           <xsl:text>[ ] </xsl:text><xsl:value-of select="node()" /><xsl:text>&#xa;</xsl:text>
           <xsl:choose>
            <xsl:when test="@correct='yes'">
              <B><xsl:text> → CORRECT</xsl:text></B>
             </xsl:when>
            <xsl:otherwise></xsl:otherwise>
           </xsl:choose>
         </tr>
         </xsl:for-each>
       </table>
    <xsl:apply-templates/>
  </xsl:template>

  <xsl:template match="//graphic" >
    <B><I><xsl:text>[ </xsl:text><xsl:value-of select="@graphic-ref"/><xsl:text> ]</xsl:text></I></B>
  </xsl:template>

  <!-- Template for [[bolding (emphasis-type='bold') contents]] -->
  <xsl:template match="//emphasis[@emphasis-type='bold']" >
    <B><xsl:apply-templates/></B>
  </xsl:template>

  <!-- Template for [[bolding (emphasis-type='italic') contents]] -->
  <xsl:template match="//emphasis[@emphasis-type='italic']" >
    <I><xsl:apply-templates/></I>
  </xsl:template>

  <!-- Template for [[formatting (TABLES)]] -->
  <xsl:template match="*/tbody" >
      <table border="01 thin" bgcolor="#FEF9E7" align="center">
        <font face = 'Arial' size = '1.75' color = 'black'>
        <tr>
          <!-- ROW_01 COL_01 -->
          <th>TEST</th>
          <!-- ROW_01 COL_02 -->
          <th>VALUES</th>
        </tr>
          <xsl:for-each select=".//row">
            <tr>
              <td>
              <!-- ".//answer-choice" lists all the descendents of the current node -->
                <xsl:text></xsl:text><xsl:value-of select="*[1]" /><xsl:text>&#xa;</xsl:text>
              </td>
              <td>
                <xsl:text></xsl:text><xsl:value-of select="*[2]" /><xsl:text>&#xa;</xsl:text>
              </td>
          </tr>
          </xsl:for-each>
        </font>
        </table>
  </xsl:template>



  <!-- Template for [[formatting (STIMULUS) section → BOLD, UNDERLINE]] -->
  <xsl:template match="question/stimulus" >
    <P><B><U>
      <xsl:text>Stimulus:</xsl:text></U></B>
      <p></p>
      <xsl:apply-templates/></P>
  </xsl:template>

  <!-- Template for [[formatting (EXPLANATION) section → TITLE]] -->
  <xsl:template match="question/explanation" >
    <P><B><I><U>
      <xsl:text>EXPLANATION:</xsl:text></U></I></B>
      <p></p>
      <xsl:apply-templates/></P>
  </xsl:template>

  <!-- Template for [[formatting (EXPLANATION) contents → paragraph spacing]] -->
  <xsl:template match="question/explanation/*" >
    <P><xsl:apply-templates/></P>
  </xsl:template>

  <!-- Template for [[formatting (REMEDIATION / REKAP) section → TITLE]] -->
  <xsl:template match="question/remediation" >
    <P><B><I><U>
      <xsl:text>REMEDIATION / REKAP</xsl:text></U></I></B>
      <p></p>
      <xsl:apply-templates/></P>
  </xsl:template>

  <!-- Template for [[formatting (REMEDIATION / REKAP) section → paragraph spacing]] -->
  <xsl:template match="question/remediation/*" >
    <P><xsl:apply-templates/></P>
  </xsl:template>

  <!-- Template for [[formatting (REMEDIATION / REKAP) section → paragraph spacing]] -->
  <xsl:template match="//list" >
    <table border="0" bgcolor="#fbeeec" align="center" width="500px">
      <xsl:for-each select="listItem">
        <tr>
        <!-- ".//answer-choice" lists all the descendents of the current node -->
        <xsl:text>➢ </xsl:text><xsl:value-of select="text()" /><xsl:text>&#xa;</xsl:text>
      </tr>
      </xsl:for-each>
    </table>
    <P></P>
 <xsl:apply-templates/>
</xsl:template>



</xsl:stylesheet>
