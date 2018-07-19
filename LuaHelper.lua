script_name("Helper Advocate")
script_description("/lhhelp - ������")
script_version("0.1.1")
script_author("Claire Redfield")
script_dependencies("SAMPFUNCS, SAMP")
require("lib.moonloader")
--------------------------------------VAR---------------------------------------
--���� �����, ��������� �������� � ���
color = 0xFFFFF
--�������� � ����������
local dlstatus = require('moonloader').download_status
--���������� ��� rpc
local sampev = require 'lib.samp.events'
local key = require 'vkeys'
local imgui = require 'imgui'
local encoding = require 'encoding'
encoding.default = 'CP1251'
u8 = encoding.UTF8
--���������� �������� �� ���������
local inicfg = require "inicfg"

local settings = inicfg.load({
	options =
	{
		startmessage = true,
		autoupdate = true,
		hideMSG = true,
		SexRP = true,
	},
	SexRP =
	{
		enable = true,
		SetSexRP = "M",
	},
	PhoneNumber =
	{
		enable = true,
		PhoneNC = "00-00-00",
	},
	radioR =
	{
		enable = true,
		textradioR = "RadioTag |",
	},
	radioF =
	{
		enable = true,
		textradioF = "FracTag |",
	},
}, 'luahelper.ini')


function main()
  while not isSampAvailable() do
    wait(1000)
  end
  sampRegisterChatCommand("lhhelp", scriptmenu)
	if settings.options.startmessage then
		sampAddChatMessage("{ffffff}* [{669acc}Helper Advocate{ffffff}]: {F3F3F3}�����: {FF6666}CM_MrQusik228 {f3f3f3}| ������ �������: {669acc}"..thisScript().version.."", 0xffffff)
		sampAddChatMessage("{ffffff}* [{669acc}Helper Advocate{ffffff}]: {f3f3f3}������ �� �������: {669acc}/lhhelp.", 0xffffff)
	end
  sampRegisterChatCommand('hist', HistoryPlayer)
  sampRegisterChatCommand('r', RadioRun)
  sampRegisterChatCommand('f', RadioFun)
  sampRegisterChatCommand('rn', RadioRunNonRP)
  sampRegisterChatCommand('fn', RadioFunNonRP)
  sampRegisterChatCommand("weather", cmdSetWeather)
  sampRegisterChatCommand('free', FreeJail)
  sampRegisterChatCommand('gojail', gojail)
  sampRegisterChatCommand('uds', udsPlayer)
	menuupdate()
	while true do
		wait(0)
		if menutrigger ~= nil then menu() menutrigger = nil end
	end
end

function sampev.onServerMessage(color, text)
	if settings.options.hideMSG and text == "�����������: /r [�����]" then 
	sampAddChatMessage("{ffffff}* [{669acc}Helper Advocate{ffffff}]: {f3f3f3}������ �� �������: {669acc}/r [���������]", 0xffffff) return false end
	
	if settings.options.hideMSG and text == "�����������: /f [�����]" then 
	sampAddChatMessage("{ffffff}* [{669acc}Helper Advocate{ffffff}]: {f3f3f3}������ �� �������: {669acc}/f [���������]", 0xffffff) return false end
	
	if settings.options.hideMSG and text == "���� ����� �� � ������" then lua_thread.create(NoFree1) return false end	
	if settings.options.hideMSG and text == "��� ������ ������� ������" then lua_thread.create(NoFree2) return false end
	if settings.options.hideMSG and text == "������ � ����� id ���" then lua_thread.create(NoFree3) return false end
	if settings.options.hideMSG and text == "���� ������� - ������� ����������. �� �� ����� ���� ��������� ��������" then lua_thread.create(NoFree4) return false end
end


function sampev.onPlayerJoin(id, color, isNCP, nickname)
    if nickname == "Sofia_Andreeva" then
        sampAddChatMessage("{ffffff}* [{669acc}Helper Advocate{ffffff}]: {f3f3f3}����� {FF6666}Sofia Andreeva {f3f3f3}����� � ����", 0xffffff)
    end
	if nickname == "Mia_Jones" then
        sampAddChatMessage("{ffffff}* [{669acc}Helper Advocate{ffffff}]: {f3f3f3}����� {FF6666}Mia Jones {f3f3f3}����� � ����", 0xffffff)
    end
	if nickname == "Ashlay_Flores" then
        sampAddChatMessage("{ffffff}* [{669acc}Helper Advocate{ffffff}]: {f3f3f3}����� {FF6666}Ashlay Flores {f3f3f3}����� � ����", 0xffffff)
    end
	if nickname == "Jessica_Mendley" then
        sampAddChatMessage("{ffffff}* [{669acc}Helper Advocate{ffffff}]: {f3f3f3}����� {FF6666}Jessica Mendley {f3f3f3}����� � ����", 0xffffff)
    end
end

function sampev.onPlayerQuit(id, reason)
    if sampGetPlayerNickname(id):find('Sofia_Andreeva') then
		sampAddChatMessage("{ffffff}* [{669acc}Helper Advocate{ffffff}]: {f3f3f3}����� {FF6666}Sofia Andreeva {f3f3f3}�������� ����", 0xffffff)
    end
	if sampGetPlayerNickname(id):find('Mia_Jones') then
		sampAddChatMessage("{ffffff}* [{669acc}Helper Advocate{ffffff}]: {f3f3f3}����� {FF6666}Mia Jones {f3f3f3}�������� ����", 0xffffff)
    end
	if sampGetPlayerNickname(id):find('Ashlay_Flores') then
		sampAddChatMessage("{ffffff}* [{669acc}Helper Advocate{ffffff}]: {f3f3f3}����� {FF6666}Ashlay Flores {f3f3f3}�������� ����", 0xffffff)
    end
	if sampGetPlayerNickname(id):find('Jessica_Mendley') then
		sampAddChatMessage("{ffffff}* [{669acc}Helper Advocate{ffffff}]: {f3f3f3}����� {FF6666}AJessica Mendley {f3f3f3}�������� ����", 0xffffff)
    end
end

function NoFree1()
sampAddChatMessage("{ffffff}* [{669acc}Helper Advocate{ffffff}]: {f3f3f3}���� ����� �� � ������", 0xffffff)
wait(1000)
	if settings.SexRP.SetSexRP == "M" then
		sampSendChat('/me ������ ����� "������������ ����������� �.�.�.�" � ������� ����� � ��������')
		sampSendChat('�� �� ��������� � �.�.�.�, �� ��������.')
		thisScript():reload()
	elseif settings.SexRP.SetSexRP == "F" then
		sampSendChat('/me ������� ����� "������������ ����������� �.�.�.�" � �������� ����� � ��������')
		sampSendChat('�� �� ��������� � �.�.�.�, �� ��������.')
		thisScript():reload()
	end
end


function NoFree2()
sampAddChatMessage("{ffffff}* [{669acc}Helper Advocate{ffffff}]: {f3f3f3}��������, �� ��� ������ ������� ������", 0xffffff)
wait(1000)
	if settings.SexRP.SetSexRP == "M" then
		sampSendChat('/me ������ ����� "������������ ����������� �.�.�.�" � ������� ����� � ��������')
		thisScript():reload()
	elseif settings.SexRP.SetSexRP == "F" then
		sampSendChat('/me ������� ����� "������������ ����������� �.�.�.�" � �������� ����� � ��������')
		thisScript():reload()
	end
end


function NoFree3()
sampAddChatMessage("{ffffff}* [{669acc}Helper Advocate{ffffff}]: {f3f3f3}��������, �� ������ ID ��� � ���� / ������� ���� ID", 0xffffff)
wait(1000)
	if settings.SexRP.SetSexRP == "M" then
		sampSendChat('/me ������ ����� "������������ ����������� �.�.�.�" � ������� ����� � ��������')
		thisScript():reload()
	elseif settings.SexRP.SetSexRP == "F" then
		sampSendChat('/me ������� ����� "������������ ����������� �.�.�.�" � �������� ����� � ��������')
		thisScript():reload()
	end
end


function NoFree4()
sampAddChatMessage("{ffffff}* [{669acc}Helper Advocate{ffffff}]: {f3f3f3}��������, �� ������ ID ��� � ���� / ������� ���� ID", 0xffffff)
wait(1000)
	if settings.SexRP.SetSexRP == "M" then
		sampSendChat('/me ������ ����� "������������ ����������� �.�.�.�" � ������� ����� � ��������')
		sampSendChat('��������, �� �� ������� ����������. �������� ���������� ��� �� �����.')
		thisScript():reload()
	elseif settings.SexRP.SetSexRP == "F" then
		sampSendChat('/me ������� ����� "������������ ����������� �.�.�.�" � �������� ����� � ��������')
		sampSendChat('��������, �� �� ������� ����������. �������� ���������� ��� �� �����.')
		thisScript():reload()
	end
end


function gojail()
sampSendChat('/s �������� �������. ����������� ���� ������������ 9.000$! ����� ��������: '..PhoneNumber)
end

function udsPlayer()
lua_thread.create(GoUdsPlayer)
end

function GoUdsPlayer()
local _, myid = sampGetPlayerIdByCharHandle(PLAYER_PED)
name = sampGetPlayerNickname(myid)
nm1, nm2 = string.match(name, "(%g+)_(%g+)")
if settings.SexRP.SetSexRP == "M" then
	sampSendChat('/do ������������ �� ��� '..nm1..' '..nm2..' � �������.')
	wait(1000)
	sampSendChat('/me ������ ������������ � �������� ��� � ����������')
	wait(1000)
	sampSendChat('/do ���: '..nm1..'. �������: '..nm2..' | ����� ��������: '..PhoneNumber..'.')
	sampSendChat('/do ���������: �������������. | ��������� � �������������: �������.')
	wait(1000)
	sampSendChat('/me ������ ������������ � ����� ����� ��� � ������')
elseif settings.SexRP.SetSexRP == "F" then
	sampSendChat('/do ������������ �� ��� '..nm1..' '..nm2..' � �������.')
	wait(1000)
	sampSendChat('/me ������� ������������ � ��������� ��� � ����������')
	wait(1000)
	sampSendChat('/do ���: '..nm1..'. �������: '..nm2..' | ����� ��������: '..PhoneNumber..'.')
	sampSendChat('/do ����������: �������������. | ��������� � �������������: �������.')
	wait(1000)
	sampSendChat('/me ������� ������������ � ����� ������ ��� � ������')
	end
end
-----------Tag Radio------------------------------------------------------
function RadioRun(text)
if text ~= nil and settings.radioF.enable == true then
	sampSendChat('/r '..(#text > 0 and ''..settings.radioR.textradioR..' '..text or ''))	
elseif text ~= nil and settings.radioF.enable == false then
	sampSendChat('/r '..(#text > 0 and ''..text or ''))
end
end

function RadioFun(text)
if text ~= nil then
	if settings.radioF.enable == true then
	sampSendChat('/f '..(#text > 0 and ''..settings.radioF.textradioF..' '..text or ''))
	else
	sampSendChat('/f '..(#text > 0 and ''..text or ''))
	end
end
end

function RadioRunNonRP(args)
  if args ~= '' then sampSendChat("/r (( "..args .." ))")
  else sampAddChatMessage("{ffffff}* [{669acc}Helper Advocate{ffffff}]: {f3f3f3}������ �� �������: {669acc}/rn [���������]", 0xffffff)
  end
end

function RadioFunNonRP(args)
  if args ~= '' then sampSendChat("/f (( "..args.." ))")
  else sampAddChatMessage("{ffffff}* [{669acc}Helper Advocate{ffffff}]: {f3f3f3}������ �� �������: {669acc}/fn [���������]", 0xffffff)
  end
end

function HistoryPlayer(args)
	pID = args:match('(%d+)')
	name = sampGetPlayerNickname(pID)
	if #args == 0 or not pID then
    sampAddChatMessage("{ffffff}* [{669acc}Helper Advocate{ffffff}]: {f3f3f3}������ �� �������: {669acc}/hist [ID]", 0xffffff)
  else
	sampSendChat('/history '..name)
  end
end


function FreeJail(args)
	pID, Cena = args:match('(%d+)%s+(.*)')
	name = sampGetPlayerNickname(pID)
	nm1, nm2 = string.match(name, "(%g+)_(%g+)")
	if #args == 0 or not pID or not Cena then
    sampAddChatMessage("{ffffff}* [{669acc}Helper Advocate{ffffff}]: {f3f3f3}������ �� �������: {669acc}/free [ID] [����]", 0xffffff)
  else
	lua_thread.create(GoFree)
  end
end

function GoFree()
if settings.SexRP.SetSexRP == "M" then
	sampSendChat('������, ������ �������� ����� ������������')
	wait(1000)
	sampSendChat('/do ����� "������������ ����������� �.�.�.�" � ��������.')
	wait(1000)
	sampSendChat('/me ������ ����� "������������ ����������� �.�.�.�" �� ��������')
	wait(1000)
	sampSendChat('/me ������ ��� � ����������� � �� �.�.�.� � ���� ��� �'..pID)
	wait(1000)
	sampSendChat('/do ��� ����� ���������: �.�: '..nm1..' '..nm2..'.')
	wait(1000)
	sampSendChat('/me ��������� ����� "������������ ����������� �.�.�.�"')
	wait(1000)
	sampSendChat('/do ����� ���: '..pID..' | �.�: '..nm1..' '..nm2..' | ����: '..Cena..'$.')
	wait(1000)
	sampSendChat('��� ������� ����� ������ ������������ �� ����� '..Cena..'$.')
	wait(1000)
	sampSendChat('/todo ������ ������� ����� �������*������ ��������� ������ ����� ��� �����.')
	sampSendChat('/do ����� ���� �� ������ "������������ ����������� �.�.�.�".')
	wait(1000)
	sampAddChatMessage("{ffffff}* [{669acc}Helper Advocate{ffffff}]: {f3f3f3}���������� ��������� ������� {FF6666}F2", 0xffffff)
	repeat
    wait(0)
    until isKeyJustPressed(VK_F2)
	sampSendChat('/free '..pID..' '..Cena)
	wait(1000)
	sampAddChatMessage("{ffffff}* [{669acc}Helper Advocate{ffffff}]: {f3f3f3}���� �� ���������� ������, �� ������� {FF6666}F2", 0xffffff)
	repeat
    wait(0)
    until isKeyJustPressed(VK_F2)
	sampSendChat('/r ��� �'..pID..' | �.� '..nm1..' '..nm2..' ��� ���������� �� �.�.�.�.')
	sampSendChat('/r ���� ������������ �� ������ ����: '..Cena..'$.')
elseif settings.SexRP.SetSexRP == "F" then
	sampSendChat('������, ������ �������� ����� ������������')
	wait(1000)
	sampSendChat('/do ����� "������������ ����������� �.�.�.�" � ��������.')
	wait(1000)
	sampSendChat('/me ������� ����� "������������ ����������� �.�.�.�" �� ��������')
	wait(1000)
	sampSendChat('/me ������� ��� � ������������ � �� �.�.�.� � ���� ��� �'..pID)
	wait(1000)
	sampSendChat('/do ��� ����� ���������: �.�: '..nm1..' '..nm2..'.')
	wait(1000)
	sampSendChat('/me ��������� ����� "������������ ����������� �.�.�.�"')
	wait(1000)
	sampSendChat('/do ����� ���: '..pID..' | �.�: '..nm1..' '..nm2..' | ����: '..Cena..'$.')
	wait(1000)
	sampSendChat('��� ������� ����� ������ ������������ �� ����� '..Cena..'$.')
	wait(1000)
	sampSendChat('/todo ������ ������� ����� �������*������ ��������� ������ ����� ��� �����.')
	sampSendChat('/do ����� ���� �� ������ "������������ ����������� �.�.�.�".')
	wait(1000)
	sampAddChatMessage("{ffffff}* [{669acc}Helper Advocate{ffffff}]: {f3f3f3}���������� ��������� ������� {FF6666}F2", 0xffffff)
	repeat
    wait(0)
    until isKeyJustPressed(VK_F2)
	sampSendChat('/free '..pID..' '..Cena)
	wait(1000)
	sampAddChatMessage("{ffffff}* [{669acc}Helper Advocate{ffffff}]: {f3f3f3}���� �� ���������� ������, �� ������� {FF6666}F2", 0xffffff)
	repeat
    wait(0)
    until isKeyJustPressed(VK_F2)
	sampSendChat('/r ��� �'..pID..' | �.� '..nm1..' '..nm2..' ��� ���������� �� �.�.�.�.')
	sampSendChat('/r ���� ������������ �� ������ ����: '..Cena..'$.')
	end
end

--------------------------------------------------------------------------------
-------------------------------------MENU---------------------------------------
--------------------------------------------------------------------------------
--������������ ����
function menuupdate()
		mod_submenus_sa = {
		{
			title = "{F3F3F3}��������� ������� {669acc}Helper Advocate",
			submenu = {
				{
					title = string.format("{f3f3f3}����������� ��� �������: {669acc}%s", settings.options.startmessage),
					onclick = function()
						if settings.options.startmessage == true then
							settings.options.startmessage = false
						else
							settings.options.startmessage = true
						end
						menuupdate()
						menu()
						inicfg.save(settings, 'luahelper.ini')
					end
				},
				{
					title = string.format("{f3f3f3}��������������: {669acc}%s", settings.options.autoupdate),
					onclick = function()
						if settings.options.autoupdate == true then
							settings.options.autoupdate = false sampAddChatMessage(('{ffffff}* [{669acc}Helper Advocate{ffffff}]: {f3f3f3}�������������� ���������'), 0xffffff)
						else
							settings.options.autoupdate = true sampAddChatMessage(('{ffffff}* [{669acc}Helper Advocate{ffffff}]: {f3f3f3}�������������� ��������'), 0xffffff)
						end
						menuupdate()
						menu()
						inicfg.save(settings, 'luahelper.ini')
					end
				},
				{
					title = string.format("{f3f3f3}��� ������� ���: {669acc}%s", settings.SexRP.SetSexRP),
					onclick = function()
						wait(200)
						sampShowDialog(9879, "������� ��� ������� ���", string.format("M - ������� | F - �������`n������� ���: {669acc}"..settings.SexRP.SetSexRP), "�������", "�������", 1)
						sampSetCurrentDialogEditboxText(settings.SexRP.SetSexRP)
						while sampIsDialogActive(9879) do wait(100) end
						local resultMain, buttonMain, typ = sampHasDialogRespond(9879)
						if buttonMain == 1 then
							if string.len(sampGetCurrentDialogEditboxText(9899)) ~= 0 and string.len(sampGetCurrentDialogEditboxText(9899)) < 99 then
								settings.SexRP.SetSexRP = sampGetCurrentDialogEditboxText(9899)
								inicfg.save(settings, 'luahelper.ini')
								menuupdate()
								menu()
							else
								menuupdate()
								menu()
							end
						else
							menuupdate()
							menu()
						end
					end
				},
			}
		},
		{
			title = "{F3F3F3}������� ������� {669acc}Helper Advocate",
			submenu = {
				{
title = string.format("{f3f3f3}C����� ������ {669acc}Helper Advocate | 1"),
onclick = function()
local luahelpcmd= [[ 
{669acc}_____________________________________________________________________________________________

{669acc}* �{ffffff}�����������, ��� {669acc}Helper Advocate ��� SAMP 	 
{669acc}* �{ffffff}�� ��� ��������� �������:

{669acc}* �{ffffff}���� � ����� � {669acc}/r {FFFFFF}| OOC ����� - {669acc}/rn;
{669acc}* �{ffffff}���� � ����� � {669acc}/f {FFFFFF}| OOC ����� - {669acc}/fn;
t{669acc}* �{ffffff}����� ������� ����� ������ {669acc}/hist [ID];
{669acc}* �{ffffff}������� ��� �� ��������� {669acc}/gojail;
{669acc}* �{ffffff}������� ������������� {669acc}/uds;
{669acc}* �{ffffff}��������� ������ �� ������ {669acc}/free [ID] [����];

{669acc}_____________________________________________________________________________________________
]]
	sampShowDialog(1010, "{f3f3f3}C����� ������ {669acc}Helper Advocate", luahelpcmd, "{ffffff}�������", "", 0)
end
				},
				{
title = string.format("{f3f3f3}C����� ������ {669acc}Helper Advocate | 2"),
onclick = function()
local luahelpcmd= [[ 
{669acc}_____________________________________________________________________________________________

{669acc}* �{ffffff}���� ����� ��� :)

{669acc}_____________________________________________________________________________________________
]]
	sampShowDialog(1010, "{f3f3f3}C����� ������ {669acc}Helper Advocate", luahelpcmd, "{ffffff}�������", "", 0)
end
				},
			}
		},
		{
			title = ' ',
		},
		{
			title = string.format("{f3f3f3}��� � ����� /r: {669acc}%s", settings.radioR.enable),
			onclick = function()
				if settings.radioR.enable == true then settings.radioR.enable = false else settings.radioR.enable = true end
				menuupdate()
				menu()
				inicfg.save(settings, 'luahelper.ini')
			end
		},
		{
			title = string.format("{f3f3f3}������� ���: {669acc}%s", settings.radioR.textradioR),
			onclick = function()
				wait(200)
				sampShowDialog(9879, "������� ��� ��� � ����� /f", string.format("������� ���: {669acc}"..settings.radioR.textradioR), "�������", "�������", 1)
				sampSetCurrentDialogEditboxText(settings.radioR.textradioR)
				while sampIsDialogActive(9879) do wait(100) end
				local resultMain, buttonMain, typ = sampHasDialogRespond(9879)
				if buttonMain == 1 then
					if string.len(sampGetCurrentDialogEditboxText(9899)) ~= 0 and string.len(sampGetCurrentDialogEditboxText(9899)) < 99 then
						settings.radioR.textradioR = sampGetCurrentDialogEditboxText(9899)
						inicfg.save(settings, 'luahelper.ini')
						menuupdate()
						menu()
					else
						menuupdate()
						menu()
					end
				else
					menuupdate()
					menu()
				end
			end
		},
		{
			title = ' ',
		},
		{
			title = string.format("{f3f3f3}��� � ����� /f: {669acc}%s", settings.radioF.enable),
			onclick = function()
				if settings.radioF.enable == true then settings.radioF.enable = false else settings.radioF.enable = true end
				menuupdate()
				menu()
				inicfg.save(settings, 'luahelper.ini')
			end
		},
		{
			title = string.format("{f3f3f3}������� ���: {669acc}%s", settings.radioF.textradioF),
			onclick = function()
				wait(200)
				sampShowDialog(9879, "������� ��� ��� � ����� /f", string.format("������� ���: {669acc}"..settings.radioF.textradioF), "�������", "�������", 1)
				sampSetCurrentDialogEditboxText(settings.radioF.textradioF)
				while sampIsDialogActive(9879) do wait(100) end
				local resultMain, buttonMain, typ = sampHasDialogRespond(9879)
				if buttonMain == 1 then
					if string.len(sampGetCurrentDialogEditboxText(9899)) ~= 0 and string.len(sampGetCurrentDialogEditboxText(9899)) < 99 then
						settings.radioF.textradioF = sampGetCurrentDialogEditboxText(9899)
						inicfg.save(settings, 'luahelper.ini')
						menuupdate()
						menu()
					else
						menuupdate()
						menu()
					end
				else
					menuupdate()
					menu()
				end
			end
		},
		{
			title = ' ',
		},
		{
			title = string.format("{f3f3f3}��� ������� ����� ��������: {669acc}%s", settings.PhoneNumber.PhoneNC),
			onclick = function()
				wait(200)
				sampShowDialog(9879, "��� ������� ����� ��������", string.format("��� ������� ����� ��������: {669acc}"..settings.PhoneNumber.PhoneNC), "�������", "�������", 1)
				sampSetCurrentDialogEditboxText(settings.PhoneNumber.PhoneNC)
				while sampIsDialogActive(9879) do wait(100) end
				local resultMain, buttonMain, typ = sampHasDialogRespond(9879)
				if buttonMain == 1 then
					if string.len(sampGetCurrentDialogEditboxText(9899)) ~= 0 and string.len(sampGetCurrentDialogEditboxText(9899)) < 99 then
						settings.PhoneNumber.PhoneNC = sampGetCurrentDialogEditboxText(9899)
						inicfg.save(settings, 'luahelper.ini')
						menuupdate()
						menu()
					else
						menuupdate()
						menu()
					end
				else
					menuupdate()
					menu()
				end
			end
		},
		{
			title = ' ',
		},
		{
			title = '{f3f3f3}~~~ {669acc}���. ��������� {F3F3F3}~~~'
		},
		-- ��� �������� ffi ������� � FYP'a
		{
			title = '����� ������� �������',
			onclick = function()
				local ffi = require 'ffi'
				ffi.cdef [[
								void* __stdcall ShellExecuteA(void* hwnd, const char* op, const char* file, const char* params, const char* dir, int show_cmd);
								uint32_t __stdcall CoInitializeEx(void*, uint32_t);
							]]
				local shell32 = ffi.load 'Shell32'
				local ole32 = ffi.load 'Ole32'
				ole32.CoInitializeEx(nil, 2 + 4)
				print(shell32.ShellExecuteA(nil, 'open', 'http://vk.com/volkov228flores', nil, nil, 1))
			end
		},
		{
			title = 'Reloading Script',
			onclick = function()
				thisScript():reload()
			end
		},
	}
end

--/rphelper menu
function menu()
	submenus_show(mod_submenus_sa, '{669acc}Helper Advocate v'..thisScript().version..' by {ff6666}CM_MrQusik228', '�������', '�������', '�����')
end

--toggle menu
function scriptmenu()
	if Enable == true then
		Enable = false
	else
		menutrigger = 1
	end
end
-- submenus_show made by FYP
function submenus_show(menu, caption, select_button, close_button, back_button)
	select_button, close_button, back_button = select_button or 'Select', close_button or 'Close', back_button or 'Back'
	prev_menus = {}
	function display(menu, id, caption)
		local string_list = {}
		for i, v in ipairs(menu) do
			table.insert(string_list, type(v.submenu) == 'table' and v.title .. '  >>' or v.title)
		end
		sampShowDialog(id, caption, table.concat(string_list, '\n'), select_button, (#prev_menus > 0) and back_button or close_button, 4)
		repeat
			wait(0)
			result, button, list = sampHasDialogRespond(id)
			if result then
				if button == 1 and list ~= -1 then
					local item = menu[list + 1]
					if type(item.submenu) == 'table' then -- submenu
						table.insert(prev_menus, {menu = menu, caption = caption})
						if type(item.onclick) == 'function' then
							item.onclick(menu, list + 1, item.submenu)
						end
						return display(item.submenu, id + 1, item.submenu.title and item.submenu.title or item.title)
					elseif type(item.onclick) == 'function' then
						local result = item.onclick(menu, list + 1)
						if not result then return result end
						return display(menu, id, caption)
					end
				else -- if button == 0
					if #prev_menus > 0 then
						local prev_menu = prev_menus[#prev_menus]
						prev_menus[#prev_menus] = nil
						return display(prev_menu.menu, id - 1, prev_menu.caption)
					end
					return false
				end
			end
		until result
	end
	return display(menu, 31337, caption or menu.title)
end

-------------Weather--------------------------------------------------
function cmdSetWeather(param)
  local weather = tonumber(param)
  if weather ~= nil and weather >= 0 and weather <= 45 then
    forceWeatherNow(weather)
  end
end

--------------------------------------------------------------------------------
------------------------------------UPDATE--------------------------------------
--------------------------------------------------------------------------------
function update()
	local fpath = os.getenv('TEMP') .. '\\version.json'
	downloadUrlToFile('https://raw.githubusercontent.com/FoxChocolate/VOLKOVAHK-MVD/master/version.json', fpath, function(id, status, p1, p2)
		if status == dlstatus.STATUS_ENDDOWNLOADDATA then
		local f = io.open(fpath, 'r')
		if f then
			local info = decodeJson(f:read('*a'))
			updatelink = info.updateurl
			if info and info.latest then
				version = tonumber(info.latest)
				if version > tonumber(thisScript().version) then
					lua_thread.create(goupdate)
				else
					update = false
				end
			end
		end
	end
end)
end
--���������� ���������� ������
function goupdate()
sampAddChatMessage(("{ffffff}* [{669acc}Helper Advocate{ffffff}]: {f3f3f3}���������� ����������. �������� ����������.."), 0xffffff)
sampAddChatMessage(("{ffffff}* [{669acc}Helper Advocate{ffffff}]: {f3f3f3}������� ������: {669acc}"..thisScript().version.." {f3f3f3}> ����� ������: {669acc}"..version), 0xffffff)
wait(300)
downloadUrlToFile(updatelink, thisScript().path, function(id3, status1, p13, p23)
	if status1 == dlstatus.STATUS_ENDDOWNLOADDATA then
	sampAddChatMessage(("{ffffff}* [{669acc}Helper Advocate{ffffff}]: {f3f3f3}���������� ���������!"), 0xffffff)
	thisScript():reload()
end
end)
end