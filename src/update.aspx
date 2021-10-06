<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="update.aspx.cs" Inherits="RAMS.login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="css/admin.css" />
    <title></title>
</head>
<body>
    <form id="formUpdate" runat="server" draggable="false">
        <div>
            <div class="update-container">
      <div class="table-container">
        <div>
          <label for="availSpaceTable" id="lblTitle"></label>
          <label id="lblNames"></label>
          <label id="lblUpdate">is placed at</label>
          <label id="lblResName"></label>
          <div>
            <h2>Available in residences:</h2>
            <div>
              <select>
                <option value="1">Jasmyn</option>
                <option value="2">Horizon</option>
                <option value="3">Kumba</option>
                <option value="4">Thuthuka</option>
                <option value="5">Vergelegen</option>
              </select>
              <div>
                <table id="availSpaceTable" class="residence-table">
                    <thead>
                      <tr>
                        <th>ID</th>
                        <th>Block</th>
                        <th>Room Number</th>
                        <th>Is Vacant</th>
                        <th>Single/Sharing</th>
                        <th>Number of Students</th>
                      </tr>
                    </thead>
                    <tbody>
                      <tr>
                        <td>1</td>
                        <td>A</td>
                        <td>G02</td>
                        <td>Yes</td>
                        <td>Single</td>
                        <td>1</td>
                      </tr>
                      <tr>
                        <td>2</td>
                        <td>A</td>
                        <td>G04</td>
                        <td>Yes</td>
                        <td>Single</td>
                        <td>1</td>
                      </tr>
                      <tr>
                        <td>3</td>
                        <td>A</td>
                        <td>G05</td>
                        <td>Yes</td>
                        <td>Single</td>
                        <td>1</td>
                      </tr>
                      <tr>
                        <td>4</td>
                        <td>A</td>
                        <td>G06</td>
                        <td>Yes</td>
                        <td>Sharing</td>
                        <td>2</td>
                      </tr>
                      <tr>
                        <td>5</td>
                        <td>A</td>
                        <td>G07</td>
                        <td>Yes</td>
                        <td>Sharing</td>
                        <td>2</td>
                      </tr>
                      <tr>
                        <td>6</td>
                        <td>A</td>
                        <td>G08</td>
                        <td>Yes</td>
                        <td>Sharing</td>
                        <td>2</td>
                      </tr>
                      <tr>
                        <td>7</td>
                        <td>A</td>
                        <td>102</td>
                        <td>Yes</td>
                        <td>Single</td>
                        <td>1</td>
                      </tr>
                      <tr>
                        <td>8</td>
                        <td>A</td>
                        <td>104</td>
                        <td>Yes</td>
                        <td>Single</td>
                        <td>1</td>
                      </tr>
                      <tr>
                        <td>9</td>
                        <td>A</td>
                        <td>105</td>
                        <td>Yes</td>
                        <td>Single</td>
                        <td>1</td>
                      </tr>
                      <tr>
                        <td>10</td>
                        <td>A</td>
                        <td>106</td>
                        <td>Yes</td>
                        <td>Sharing</td>
                        <td>2</td>
                      </tr>
                      <tr>
                        <td>11</td>
                        <td>A</td>
                        <td>107</td>
                        <td>Yes</td>
                        <td>Sharing</td>
                        <td>2</td>
                      </tr>
                      <tr>
                        <td>11</td>
                        <td>A</td>
                        <td>108</td>
                        <td>Yes</td>
                        <td>Sharing</td>
                        <td>2</td>
                      </tr>
                    </tbody>
                  </table>
              </div>
            </div>
            
          </div>
        </div>
      </div>
      <div class="ctrl-container">
          <div>
            <label for="" id="lblBlock">Block:</label>
            <select>
                <optgroup label="A-E">
                  <option value="1">A</option>
                  <option value="2">B</option>
                  <option value="3">C</option>
                  <option value="4">AB</option>
                  <option value="5">AC</option>
                  <option value="6">D</option>
                  <option value="7">E</option>
                </optgroup>
                <optgroup label="F-J">
                  <option value="8">F</option>
                  <option value="9">G</option>
                  <option value="10">H</option>
                  <option value="11">I</option>
                  <option value="12">J</option>
                </optgroup>
                <optgroup label="K-R">
                  <option value="13">K</option>
                  <option value="14">L</option>
                  <option value="15">M</option>
                  <option value="16">Q</option>
                  <option value="17">R</option>
                </optgroup>
                <optgroup label="S-V">
                  <option value="18">S</option>
                  <option value="19">T</option>
                  <option value="20">U</option>
                  <option value="21">V</option>
                  <option value="22">U</option>
                </optgroup>
            </select>
          </div>
          <div>
              <label id="lblRoonNo">Room number:</label>
              <select>
                <optgroup label="Ground floor">
                  <option value="1">G02</option>
                  <option value="2">G04</option>
                  <option value="3">G05</option>
                  <option value="4">G06</option>
                  <option value="5">G07</option>
                  <option value="6">GO8</option>
                </optgroup>
                <optgroup label="1st floor">
                  <option value="7">102</option>
                  <option value="8">104</option>
                  <option value="9">105</option>
                  <option value="10">106</option>
                  <option value="11">107</option>
                  <option value="12">108</option>
                </optgroup>
              </select>
          </div>
          <div>
              <button type="button" id="btnUpdate2" class="btn">Update</button>
          </div>
      </div>
    </div>
        </div>
    </form>
</body>
</html>
