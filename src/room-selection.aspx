<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="room-selection.aspx.cs" Inherits="RAMS.login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="css/room-selection.css" />
    <title>Room Selection</title>
</head>
<body>
    <form id="formRoomSelection" runat="server" draggable="false">
        <div>
            <div class="grid-container">
      <div class="header">
        <div>
          <!-- <button type="button">Back</button> -->

          <h1>Room Selection</h1>
          <div></div>
        </div>
      </div>
      <div class="content">
        <div class="box box-one">
          <!-- <div class="circle"></div> -->
          <p>You are placed at</p>
          <label id="lblResName"></label>
        </div>
        <div>
          <h2>Check the floor plan below before choosing a room:</h2>
        </div>
        <div class="box box-two">
          <img src="images/k-floor.jpg" class="floor-img" />
        </div>
        <div>
          <h2 class="h2-block">Choose a preferred block:</h2>
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
          <h2 class="rooms">Rooms available:</h2>
        </div>
        <!-- <div class="box box-three">
          
        </div> -->
        <div class="floor ground-floor">
          <h2>Ground floor:</h2>
          <div class="single-rooms">
            <h3>Singles:</h3>
            <input type="radio" id="rbtnG02" name="rooms" />
            <label for="rbtnG02" class="rbtn">G02</label>
            <input type="radio" id="rbtnG04" name="rooms" />
            <label for="rbtnG04" class="rbtn">G04</label>
            <input type="radio" id="rbtnG05" name="rooms" />
            <label for="rbtnG05" class="rbtn">G05</label>
          </div>
          <div class="sharing-rooms">
            <h3>Sharing:</h3>
            <input type="radio" id="rbtnG06" name="rooms" />
            <label for="rbtnG06" class="rbtn">G06</label>
            <input type="radio" id="rbtnG07" name="rooms" />
            <label for="rbtnG07" class="rbtn">G07</label>
            <input type="radio" id="rbtnG08" name="rooms" />
            <label for="rbtnG08" class="rbtn">G08</label>
          </div>
        </div>
        <div class="floor first-floor">
          <h2>First floor:</h2>
          <div class="single-rooms">
            <h3>Singles:</h3>
            <input type="radio" id="rbtn102" name="rooms" />
            <label for="rbtn102" class="rbtn">102</label>
            <input type="radio" id="rbtn104" name="rooms" />
            <label for="rbtn104" class="rbtn">104</label>
            <input type="radio" id="rbtn105" name="rooms" />
            <label for="rbtn105" class="rbtn">105</label>
          </div>
          <div class="sharing-rooms">
            <h3>Sharing:</h3>
            <input type="radio" id="rbtn106" name="rooms" />
            <label for="rbtn106" class="rbtn">106</label>
            <input type="radio" id="rbtn107" name="rooms" />
            <label for="rbtn107" class="rbtn">107</label>
            <input type="radio" id="rbtn108" name="rooms" />
            <label for="rbtn108" class="rbtn">108</label>
          </div>
        </div>
        <div>
          <button  id="btnChooseRoom" runat="server" class="btn-choose">
            Choose room
          </button>
        </div>
      </div>
      <!-- <div class="footer"></div> -->
    </div>
        </div>
    </form>
</body>
</html>
